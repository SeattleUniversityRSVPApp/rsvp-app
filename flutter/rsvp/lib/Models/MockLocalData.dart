import 'package:rsvp/Models/FakeData.dart';
import 'package:rsvp/Models/ILocalData.dart';
import 'event.dart';

class MockLocalData extends IlocalData {
  final List<Event> _createdEvents = [
    FakeData.fakeEventData[1],
    FakeData.fakeEventData[2],
  ];
  final List<Event> _respondedEvents = [
    FakeData.fakeEventData[4],
    FakeData.fakeEventData[5],
  ];
  String _defaultName = 'Unknown';

  @override
  Future<List<Event>> getCreatedEvents() {
    return Future.value(_createdEvents);
  }

  @override
  String addCreatedEvents(Event newEvent) {
    _createdEvents.add(newEvent);
    // TODO: add a return value for this method.
    return '';
  }

  @override
  bool changeDefaultName(String name) {
    _defaultName = name;
    return true;
  }

  @override
  bool deleteRespondentEvent(String link) {
    for (int i = 0; i < _respondedEvents.length; i++) {
      var targetEvent = _respondedEvents[i];
      if (targetEvent.link == link) {
        _respondedEvents.remove(targetEvent);
      }
    }
    return saveRespondentEvents();
  }

  @override
  bool saveRespondentEvents() {
    return true;
  }

  @override
  Future<String> getDefaultName() {
    return Future.value(_defaultName);
  }

  String getDefaultNameFromLocal() {
    return _defaultName;
  }

  @override
  String addRespondedEvent(Event newEvent) {
    _respondedEvents.add(newEvent);
    // TODO: add a return value for this method.
    return '';
  }

  @override
  Future<List<Event>> getRespondedEvents() {
    return Future.value(_respondedEvents);
  }

  @override
  bool deleteCreatorEvent(String link) {
    for (int i = 0; i < _createdEvents.length; i++) {
      var targetEvent = _createdEvents[i];
      if (targetEvent.link == link) {
        _createdEvents.remove(targetEvent);
      }
    }
    return saveCreatorEvents();
  }

  @override
  bool saveCreatorEvents() {
    return true;
  }
}
