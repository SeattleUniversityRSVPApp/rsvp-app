import 'package:rsvp/Models/ILocalData.dart';

import 'event.dart';

class MockLocalData extends IlocalData {
  static final _urlTemplate = 'https://www.my-test-unique-url-';
  List<Event> _createdEvents = [
    Event(_urlTemplate + (1).toString(), 'Walk with dogs', '', '',
        DateTime.parse('2020-08-16'), '', 0, true),
    Event(_urlTemplate + (2).toString(), 'Finish this project', '', '',
        DateTime.parse('2020-09-08'), '', 0, true),
  ];
  List<Event> _respondedEvents = [
    Event(_urlTemplate + (4).toString(), 'Find internship', '', '',
        DateTime.parse('2020-11-17'), '', 0, true),
    Event(_urlTemplate + (5).toString(), 'Party Night', '', '',
        DateTime.parse('2020-12-31'), '', 0, true),
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
