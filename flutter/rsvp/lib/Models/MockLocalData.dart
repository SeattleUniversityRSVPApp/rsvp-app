import 'package:rsvp/Models/FakeData.dart';
import 'package:rsvp/Models/ILocalData.dart';

import 'event.dart';

class MockLocalData extends IlocalData {
  List<Event> _createdEvents = [
    FakeData.fakeEventData[1],
    FakeData.fakeEventData[2],
  ];
  List<Event> _respondedEvents = [
    FakeData.fakeEventData[4],
    FakeData.fakeEventData[5],
  ];
  String _defaultName = "Unknown";

  @override
  Future<List<Event>> getCreatedEvents() {
    return Future.value(_createdEvents);
  }

  @override
  String addCreatedEvents(Event newEvent) {
    _createdEvents.add(newEvent);
  }

  @override
  bool changeDefaultName(String name) {
    _defaultName = name;
    return true;
  }

  @override
  String getDefaultName() {
    return _defaultName;
  }

  @override
  String addRespondedEvent(Event newEvent) {
    _respondedEvents.add(newEvent);
  }

  @override
  Future<List<Event>> getRespondedEvents() {
    return Future.value(_respondedEvents);
  }
}
