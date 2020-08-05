import 'dart:convert';
import 'package:rsvp/Models/event.dart';
import 'package:rsvp/Models/JsonHandler.dart';
import 'ILocalData.dart';

class LocalData implements IlocalData {
  static List<Event> createdEventsList = [];
  static List<Event> respondedEventsList = [];
  String defaultName = null;
  String userId;

  final _urlTemplate = 'https://www.my-test-unique-url-';

  @override
  String addCreatedEvents(Event newEvent) {
    createdEventsList.add(newEvent);
    String testToJson = jsonEncode(createdEventsList);
    print(testToJson);
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
    // TODO:Call Function in JsonHandler
    String testToJson = jsonEncode(createdEventsList);
    List userMap = jsonDecode(testToJson) as List;
    List<Event> newList = convertDynamicListToEventList(userMap);
    print(newList);
    return createdEventsList;
  }

  List<Event> convertDynamicListToEventList(List userMap) {
    List<Event> newList = [];
    for(int i = 0; i < userMap.length; i++) {
      newList.add(Event(userMap[i]['link'] as String, userMap[i]['name'] as String, userMap[i]['creator'] as String,
          userMap[i]['description'] as String, DateTime.parse(userMap[i]['date'] as String),
          userMap[i]['location'] as String, int.parse(userMap[i]['minNum'] as String), userMap[0]['status'] == "true"));
    }
    return newList;
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
