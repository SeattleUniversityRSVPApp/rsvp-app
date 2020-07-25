import 'package:rsvp/Models/IEventRepository.dart';
import 'event.dart';

class EventRepository implements IEventRepository {
  @override
  Event createEvent(String eventTitle, String eventLocation, DateTime dateTime,
      String eventDescription, String creatorName) {
    return null;
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
    return null;
  }

  @override
  Event getEvent(String link) {
    return null;
  }

  @override
  bool editEvent(String link, DateTime date, String location) {
    return false;
  }
}
