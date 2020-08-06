import 'dart:async';
import 'dart:convert';
import 'package:rsvp/Models/event.dart';
import 'ILocalData.dart';
import 'JsonHandler.dart';

class LocalData implements IlocalData {
  static List<Event> createdEventsList = [];
  static List<Event> respondedEventsList = [];
  String defaultName = null;
  String userId;

  final _urlTemplate = 'https://www.my-test-unique-url-';

  @override
  String addCreatedEvents(Event newEvent) {
    createdEventsList.add(newEvent);
    String stringJsonFormat = jsonEncode(createdEventsList);
    print(stringJsonFormat);
    JsonHandler().saveCreatedEvents(stringJsonFormat);
    return null;
  }

  @override
  Future<List<Event>> getCreatedEvents() async {
    /// To Test Created Events
    /*var eventIdCounter = 1;
    if (createdEventsList.isEmpty) {
      // TODO: Move this to a MockLocalData class instead
      createdEventsList = [
        Event(
            _urlTemplate + (eventIdCounter++).toString(),
            'Walk with dogs',
            '',
            '',
            DateTime.parse('2020-08-16'),
            '',
            0,
            true),
        Event(
            _urlTemplate + (eventIdCounter++).toString(),
            'Finish this project',
            '',
            '',
            DateTime.parse('2020-09-08'),
            '',
            0,
            true),
      ];
    }
    String stringJsonFormat2 = jsonEncode(createdEventsList);
    print(stringJsonFormat2);
    JsonHandler().saveCreatedEvents(stringJsonFormat2);*/
    String stringJsonFormat = await JsonHandler().readCreatedEvents();
    List userMap = jsonDecode(stringJsonFormat) as List;
    createdEventsList = _convertDynamicListToEventList(userMap);
    return createdEventsList;
  }

  List<Event> _convertDynamicListToEventList(List userMap) {
    List<Event> newList = [];
    for(int i = 0; i < userMap.length; i++) {
      newList.add(Event(userMap[i]['link'] as String, userMap[i]['name'] as String, userMap[i]['creator'] as String,
          userMap[i]['description'] as String, DateTime.parse(userMap[i]['date'] as String),
          userMap[i]['location'] as String, int.parse(userMap[i]['minNum'] as String), userMap[0]['status'] == "true"));
    }
    return newList;
  }

  @override
  String addRespondedEvent(Event newEvent) {
    String stringJsonFormat = jsonEncode(respondedEventsList);
    print(stringJsonFormat);
    JsonHandler().saveCreatedEvents(stringJsonFormat);
    return null;
  }

  @override
  Future<List<Event>> getRespondedEvents() async {
    /// To Test Responded Events
    /*var eventIdCounter = 3;
    respondedEventsList = [
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Visit Museum', '',
          '', DateTime.parse('2020-10-28'), '', 0, true),
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Find internship', '',
          '', DateTime.parse('2020-11-17'), '', 0, true),
      Event(_urlTemplate + (eventIdCounter++).toString(), 'Party Night', '', '',
          DateTime.parse('2020-12-31'), '', 0, true),
    ];
    String stringJsonFormat = jsonEncode(respondedEventsList);
    print(stringJsonFormat);
    JsonHandler().saveRespondedEvents(stringJsonFormat);*/
    String stringJsonFormat = await JsonHandler().readRespondedEvents();
    List userMap = jsonDecode(stringJsonFormat) as List;
    respondedEventsList = _convertDynamicListToEventList(userMap);
    return respondedEventsList;
  }

  List<String> saveEvents() {
    return null;
  }

  @override
  bool changeDefaultName(String name) {
    defaultName = name;
    return true;
  }

  @override
  String getDefaultName() {
    return defaultName;
  }

}
