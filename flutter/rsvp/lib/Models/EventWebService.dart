import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/event.dart';

import 'Response.dart';

class EventWebService implements IEventWebService {
  @override
  Event createEvent(String eventName, String creatorName, DateTime eventDate,
      int minNum, String eventDescription, String eventLocation){
    // TODO: implement createEvent

    return null;
  }

  @override
  bool editEvent() {
    // TODO: implement editEvent
    return false;
  }

  @override
  Event getEvent(String link) {
    return null;
  }

  @override
  Response joinEvent(String link, String name) {
    // TODO: implement joinEvent
    return null;
  }

  @override
  bool cancelEvent(String link) {
    // TODO: implement cancelEvent
    return false;
  }
}
