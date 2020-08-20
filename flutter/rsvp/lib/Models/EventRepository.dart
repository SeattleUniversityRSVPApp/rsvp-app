import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/ILocalData.dart';
import 'event.dart';

class EventRepository implements IEventRepository {
  IlocalData _localDataObj = null;

  final Map<String, Event> _cachedEvents = <String, Event>{};
  final IEventWebService _eventWebService;
  List<VoidCallback> _myEventsListeners = [];
  List<VoidCallback> _userNameListeners = [];

  EventRepository(this._eventWebService, this._localDataObj);

  @override
  Event createEvent(String eventName, String creatorName, DateTime eventDate, int minNum,
      String eventDescription, String eventLocation) {
    var aNewEvent = _eventWebService.createEvent(
        eventName, creatorName, eventDate, minNum, eventDescription, eventLocation);
    if (aNewEvent != null) {
      _localDataObj.addCreatedEvents(aNewEvent);

      _cachedEvents[aNewEvent.link] =
          aNewEvent; //save this new event in the cache in the memory.

      for (var listener in _myEventsListeners) {
        listener.call();
      }
    }
    return aNewEvent;
  }

  @override
  Event joinEvent(String link, String respondentName) {
    var event = getEvent(link);

    if (event == null) {
      return null;
    }

    _eventWebService.joinEvent(link, respondentName);

    return event;
  }

  @override
  Event cancelEvent(String link) {
    return null;
  }

  @override
  bool deleteEvent(String link) {
    if(_cachedEvents.containsKey(link)) {
      _cachedEvents.remove(link);
    }
    bool isSuccessful = _localDataObj.deleteRespondentEvent(link);
    for (var listener in _myEventsListeners) {
      listener.call();
    }
    return isSuccessful;
  }

  @override
  Future<List<Event>> getCreatedEvents() async {
    return await _localDataObj.getCreatedEvents();
    // TODO:  get latest updated events from service, and also store in-memory cache.
  }

  @override
  Future<List<Event>> getRespondentEvents() async {
    return await _localDataObj.getRespondedEvents();
    // TODO:  get latest updated events from service, and also store in-memory cache.
  }

  @override
  Event getEvent(String link) {
    // If this event is cached, then use that and don't send a request to the service.
    if (_cachedEvents.containsKey(link)) {
      return _cachedEvents[link];
    }
    //else ask service and update the cache in the memory
    var retrievedEvent = _eventWebService.getEvent(link);
    _cachedEvents[link] = retrievedEvent;
    return retrievedEvent;
  }

  @override
  bool editEvent(String link, DateTime date, String location) {
    return false;
  }

  @override
  Future<String> getUserName() {
    return _localDataObj.getDefaultName();
  }

  @override
  String getUserNameFromLocal() {
    return _localDataObj.getDefaultNameFromLocal();
  }

  @override
  bool setUserName(String name) {
    var isSuccessful = _localDataObj.changeDefaultName(name);
    for (var listener in _userNameListeners) {
      listener.call();
    }
    return isSuccessful;
  }

  @override
  void addMyEventsListener(VoidCallback listener) {
    _myEventsListeners.add(listener);
  }

  @override
  void addChangeUserNameListener(VoidCallback listener) {
    _userNameListeners.add(listener);
  }
}
