import 'Response.dart';
import 'event.dart';

abstract class IEventWebService {
  Event createEvent(String eventName, String creatorName, DateTime eventDate,
      int minNum, String eventDescription, String eventLocation);

  bool editEvent();

  Event getEvent(String link);

  Response joinEvent(String link, String name);

  bool cancelEvent(String link);
}
