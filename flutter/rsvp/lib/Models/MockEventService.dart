import 'package:rsvp/Models/FakeData.dart';
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'Response.dart';
import 'event.dart';

class MockEventService implements IEventWebService {
  static final MockEventService _webServiceSingleton =
      MockEventService._internal();

  final Map<String, Event> _mockEventTable = <String, Event>{};
  final Map<int, Response> _mockResponseTable = <int, Response>{};

  factory MockEventService() {
    return _webServiceSingleton;
  }

  MockEventService._internal() {
    // Initialization logic is here:
    // Add some events in the mock table:
    _mockEventTable[FakeData.fakeEventData[0].link] = FakeData.fakeEventData[0];
    _mockEventTable[FakeData.fakeEventData[1].link] = FakeData.fakeEventData[1];
    _mockEventTable[FakeData.fakeEventData[2].link] = FakeData.fakeEventData[2];
    _mockEventTable[FakeData.fakeEventData[3].link] = FakeData.fakeEventData[3];
    _mockEventTable[FakeData.fakeEventData[4].link] = FakeData.fakeEventData[4];
    _mockEventTable[FakeData.fakeEventData[5].link] = FakeData.fakeEventData[5];
    _mockResponseTable[FakeData.fakeResponseData[0].id] = FakeData.fakeResponseData[0];
    _mockResponseTable[FakeData.fakeResponseData[1].id] = FakeData.fakeResponseData[1];
    _mockResponseTable[FakeData.fakeResponseData[2].id] = FakeData.fakeResponseData[2];
  }

  @override
  Event createEvent(String eventName, String creatorName, DateTime eventDate,
      int minNum, String eventDescription, String eventLocation) {
    var newEvent = Event(
        FakeData.urlTemplate + (FakeData.eventIdCounter++).toString(),
        eventName,
        creatorName,
        eventDescription,
        eventDate,
        eventLocation,
        minNum,
        true);
    _mockEventTable[newEvent.link] = newEvent;
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

  @override
  bool cancelEvent(String link) {
    if (_mockEventTable.containsKey(link)) {
      _mockEventTable.remove(link);
      return true;
    }
    return true;
  }

  @override
  Response joinEvent(String link, String name) {
    var newResponse = Response(link, FakeData.responseIdCounter, name, true);
    _mockResponseTable[FakeData.responseIdCounter++] = newResponse;
    return newResponse;
  }
}
