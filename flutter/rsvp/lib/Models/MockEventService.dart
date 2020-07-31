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
    var event1 = Event('Basketball Game', '08/03/2020');
    var event2 = Event('Walk with dogs', '08/16/2020');
    var event3 = Event('Finish this project', '09/08/2020');
    var event4 = Event('Visit Museum', '10/28/2020');
    var event5 = Event('Find internship', '11/17/2020');
    var event6 = Event('Party Night', '12/31/2020');

    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event1;
    _eventIdCounter++;
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event2;
    _eventIdCounter++;
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event3;
    _eventIdCounter++;
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event4;
    _eventIdCounter++;
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event5;
    _eventIdCounter++;
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = event6;
    _eventIdCounter++;
  }

  @override
  Event createEvent(String eventName, String eventDate, int minNum,
      String eventDescription, String eventLocation) {
    var newEvent = Event(eventName, eventDate);
    _mockEventTable[_urlTemplate + _eventIdCounter.toString()] = newEvent;
    _eventIdCounter++;
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
