import 'package:rsvp/Models/IEventRepository.dart';
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/LocalData.dart';
import 'event.dart';

class EventRepository implements IEventRepository {
  final Map<String, Event> _cachedEvents = <String, Event>{};
  final IEventWebService _eventWebService;

  EventRepository(this._eventWebService);

  @override
  Event createEvent(String eventName, String eventDate, int minNum,
      String eventDescription, String eventLocation) {
    var aNewEvent = _eventWebService.createEvent(
        eventName, eventDate, minNum, eventDescription, eventLocation);
    _cachedEvents[aNewEvent.link] =
        aNewEvent; //save this new event in the cache in the memory.
    return aNewEvent;
  }

  @override
  Event joinEvent(String link, String respondentName) {
    return null;
  }

  @override
  Event cancelEvent(String link) {
    return null;
  }

  @override
  List<Event> getMyEvents() {
    return LocalData().getCreatedEvents() + LocalData().getRespondedEvents();
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
}
