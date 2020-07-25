import 'event.dart';

abstract class IEventRepository {
  Event createEvent(String eventTitle, String eventLocation, DateTime dateTime,
      String eventDescription, String creatorName);

  bool editEvent(String link, DateTime date, String location);

  Event getEvent(String link);

  List<Event> getMyEvents();

  Event cancelEvent(String link);

  Event joinEvent(String link, String respondentName);
}
