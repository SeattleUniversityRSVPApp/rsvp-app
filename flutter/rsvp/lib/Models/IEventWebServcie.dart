import 'event.dart';

abstract class IEventWebService {
  Event createEvent(String eventName, String eventDate, int minNum,
      String eventDescription, String eventLocation);

  bool editEvent();

  Event getEvent(String link);
}
