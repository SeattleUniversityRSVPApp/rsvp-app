import 'dart:collection';

import 'package:rsvp/Models/IEventWebServcie.dart';

import 'event.dart';

class MockEventService implements IEventWebService {
  Map<String, Event> _mockEventTable = <String, Event>{};
  int _eventIdCounter = 0;

  MockEventService() {
    //Add some events:
    Event _event1;
    Event _event2;
    Event _event3;
    Event _event4;
    //Add _event1, _event2, _event3, _event4
  }

  @override
  bool createEvent() {
    return false;
  }

  @override
  Event getEvent(String link) {
    return null;
  }

  @override
  bool editEvent() {
    return false;
  }
}
