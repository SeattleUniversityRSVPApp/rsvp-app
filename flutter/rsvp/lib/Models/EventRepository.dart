import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/ILocalData.dart';
import 'event.dart';

class EventRepository implements IEventRepository {
  IlocalData _localDataObj = null;

  final Map<String, Event> _cachedEvents = <String, Event>{};
  IEventWebService _eventWebService;
  List<VoidCallback> _myEventsListeners = [];

  EventRepository(this._eventWebService, this._localDataObj);

  @override
  Event createEvent(String eventName, DateTime eventDate, int minNum,
      String eventDescription, String eventLocation) {
    var aNewEvent = _eventWebService.createEvent(
        eventName, eventDate, minNum, eventDescription, eventLocation);
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
    if(event != null) {
      _cachedEvents[event.link] =
          event;
    }
    var newRespondent = _eventWebService.joinEvent(link, respondentName);

  }

  @override
  Event cancelEvent(String link) {
    return null;
  }

  @override
  Future<List<Event>> getMyEvents() async {
    return await _localDataObj.getCreatedEvents() + await _localDataObj.getRespondedEvents();
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
  String getCustomerName() {
    return _localDataObj.getDefaultName();
  }

  @override
  bool setCustomerName(String name) {
    return _localDataObj.changeDefaultName(name);
  }

  @override
  void addMyEventsListener(VoidCallback listener) {
    _myEventsListeners.add(listener);
  }
}
