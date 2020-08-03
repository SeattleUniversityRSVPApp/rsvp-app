import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:rsvp/Models/event.dart';
import 'ILocalData.dart';
import 'JsonHandler.dart';

class LocalData implements IlocalData {
  List<Event> createdEventsList;
  List<Event> respondedEventsList;
  String defaultName = null;
  String userId;

  final _urlTemplate = 'https://www.my-test-unique-url-';

  @override
  String addCreatedEvents() {
    return null;
  }

  @override
  List<Event> getCreatedEvents() {
    var eventIdCounter = 1;
    createdEventsList = [
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Walk with dogs', '',
          '', DateTime.parse('2020-08-16'), '', 0, true),
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Finish this project',
          '', '', DateTime.parse('2020-09-08'), '', 0, true),
    ];
    return createdEventsList;
  }

  @override
  String addRespondedEvent() {
    return null;
  }

  @override
  List<Event> getRespondedEvents() {
    var eventIdCounter = 3;
    respondedEventsList = [
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Visit Museum', '',
          '', DateTime.parse('2020-10-28'), '', 0, true),
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Find internship', '',
          '', DateTime.parse('2020-11-17'), '', 0, true),
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Party Night', '', '',
          DateTime.parse('2020-12-31'), '', 0, true),
    ];
    return respondedEventsList;
  }

  List<String> saveEvents() {
    return null;
  }
}
