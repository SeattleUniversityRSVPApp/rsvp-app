import 'package:rsvp/Models/IEventWebServcie.dart';

import 'event.dart';

class MockEventService implements IEventWebService {
  final Map<String, Event> _mockEventTable = <String, Event>{};
  int _eventIdCounter = 0;
  final _urlTemplate = 'https://www.my-test-unique-url-';

  MockEventService() {
    //Add some events in the mock table:
    var event1 = Event('Basketball Game', '08/29/2020');
//    var event2 = Event();
//    var event3 = Event();
//    var event4 = Event();
//    var event5 = Event();

    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event1;
    _eventIdCounter++;
//    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event2;
  }

  @override
  bool createEvent() {
    return false;
  }

  @override
  Event getEvent(String link) {
    return _mockEventTable[link];
  }

  @override
  bool editEvent() {
    return false;
  }
}
