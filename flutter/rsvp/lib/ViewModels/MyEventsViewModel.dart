import 'package:rsvp/Models/EventRepository.dart';
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/event.dart';

class MyEventsViewModel {
  static IEventWebService IEventWebServiceObj;
  var EventRepositoryObj = EventRepository(IEventWebServiceObj);
  List<Event> events;

  openEventDetails() {

  }

  openCreateEvent() {

  }

  openJoinEvent() {

  }

  openSettings() {

  }

  List<Event> onLoad() {
    return EventRepositoryObj.getMyEvents();
  }


}