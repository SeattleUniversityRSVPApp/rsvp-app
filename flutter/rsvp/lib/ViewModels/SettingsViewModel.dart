import 'package:rsvp/Models/EventRepository.dart';
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/MockEventService.dart';

class SettingsViewModel {
  static IEventWebService IEventWebServiceObj = MockEventService();
  var EventRepositoryObj = EventRepository(IEventWebServiceObj);

  bool save(String name) {
       EventRepositoryObj.setCustomerName(name);
    return true;
  }

  String getName() {
    return EventRepositoryObj.getCustomerName();
  }

  bool onLoad() {
    EventRepositoryObj.getCustomerName();
    return true;
  }

}