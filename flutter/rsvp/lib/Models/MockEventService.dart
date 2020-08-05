import 'package:rsvp/Models/IEventWebServcie.dart';

import 'event.dart';

class MockEventService implements IEventWebService {
  static final MockEventService _webServiceSingleton =
  MockEventService._internal();

  final Map<String, Event> _mockEventTable = <String, Event>{};
  int _eventIdCounter = 0;
  final _urlTemplate = 'https://www.my-test-unique-url-';

  factory MockEventService() {
    return _webServiceSingleton;
  }

  MockEventService._internal() {
    // Initialization logic is here:
    // Add some events in the mock table:
    var event1 = Event(_urlTemplate + (_eventIdCounter++).toString(),
        'Basketball Game', '', '', DateTime.parse('2020-08-03'), '', 0, true);
    var event2 = Event(_urlTemplate + (_eventIdCounter++).toString(),
        'Walk with dogs', '', '', DateTime.parse('2020-08-16'), '', 0, true);
    var event3 = Event(
        _urlTemplate + (_eventIdCounter++).toString(),
        'Finish this project',
        '',
        '',
        DateTime.parse('2020-09-08'),
        '',
        0,
        true);
    var event4 = Event(_urlTemplate + (_eventIdCounter++).toString(),
        'Visit Museum', '', '', DateTime.parse('2020-10-28'), '', 0, true);
    var event5 = Event(_urlTemplate + (_eventIdCounter++).toString(),
        'Find internship', '', '', DateTime.parse('2020-11-17'), '', 0, true);
    var event6 = Event(_urlTemplate + (_eventIdCounter++).toString(),
        'Party Night', '', '', DateTime.parse('2020-12-31'), '', 0, true);

    _mockEventTable[event1.link] = event1;
    _mockEventTable[event2.link] = event2;
    _mockEventTable[event3.link] = event3;
    _mockEventTable[event4.link] = event4;
    _mockEventTable[event5.link] = event5;
    _mockEventTable[event6.link] = event6;
  }

  @override
  Event createEvent(String eventName, DateTime eventDate, int minNum,
      String eventDescription, String eventLocation) {
    var newEvent = Event(_urlTemplate + (_eventIdCounter++).toString(),eventName,
        '', eventDescription, eventDate, eventLocation, minNum, true);
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = newEvent;
    // If unsuccessful to create a new event, return ull;
    return newEvent;
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
