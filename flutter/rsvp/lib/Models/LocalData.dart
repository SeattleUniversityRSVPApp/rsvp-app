import 'dart:async';
import 'dart:convert';
import 'package:rsvp/Models/event.dart';
import 'ILocalData.dart';
import 'JsonHandler.dart';

class LocalData implements IlocalData {
  static List<Event> createdEventsList = [];
  static List<Event> respondedEventsList = [];
  static var jsonhandler = JsonHandler();
  String _defaultName = 'Unknown';
  String _userId;

  @override
  String addCreatedEvents(Event newEvent) {
    createdEventsList.add(newEvent);
    var stringJsonFormat = jsonEncode(createdEventsList);
    print(stringJsonFormat);
    jsonhandler.saveCreatedEvents(stringJsonFormat);
    // TODO: this method should return something to show addCreatedEvents is done or not.
    return null;
  }

  @override
  Future<List<Event>> getCreatedEvents() async {
    try {
      var stringJsonFormat = await JsonHandler().readCreatedEvents();
      var userMap = jsonDecode(stringJsonFormat) as List;
      createdEventsList = _convertDynamicListToEventList(userMap);
    } catch (exception) {
      // If the file doesn't exist, there aren't any createdEvents. So, return an empty list.
      print("Created file: Couldn't read this file");
    }
    return createdEventsList;
  }

  List<Event> _convertDynamicListToEventList(List userMap) {
    List<Event> newList = [];
    for (var i = 0; i < userMap.length; i++) {
      newList.add(Event(
          userMap[i]['link'] as String,
          userMap[i]['name'] as String,
          userMap[i]['creator'] as String,
          userMap[i]['description'] as String,
          DateTime.parse(userMap[i]['date'] as String),
          userMap[i]['location'] as String,
          int.parse(userMap[i]['minNum'] as String),
          userMap[0]['status'] == "true"));
    }
    return newList;
  }

  @override
  String addRespondedEvent(Event newEvent) {
    respondedEventsList.add(newEvent);
    String stringJsonFormat = jsonEncode(respondedEventsList);
    print(stringJsonFormat);
    jsonhandler.saveCreatedEvents(stringJsonFormat);
    return null;
  }

  @override
  Future<List<Event>> getRespondedEvents() async {
    try {
      var stringJsonFormat = await jsonhandler.readRespondedEvents();
      var userMap = jsonDecode(stringJsonFormat) as List;
      respondedEventsList = _convertDynamicListToEventList(userMap);
    }
    catch(exception)
    {
      // If the file doesn't exist, there aren't any respondedEvents. So, return an empty list.
      print("Responded file: Couldn't read this file");
    }
    return respondedEventsList;
  }

  @override
  bool deleteRespondentEvent(String link) {
    print('Target: ' + link);
    for(int i = 0; i < respondedEventsList.length; i++) {
      var targetEvent = respondedEventsList[i];
      print('Target: ' + respondedEventsList[i].link);
      if(targetEvent.link == link) {
        print(link + " vs " + respondedEventsList[i].link);
        respondedEventsList.remove(respondedEventsList[i]);
      }
    }
    print(respondedEventsList);
    return saveRespondentEvents();
  }

  @override
  bool saveRespondentEvents() {
    try {
      String stringJsonFormat = jsonEncode(respondedEventsList);
      print(stringJsonFormat);
      jsonhandler.saveRespondedEvents(stringJsonFormat);
      return true;
    } catch(exception) {
      print("Responded file: Couldn't update this file");
      return false;
    }
  }

  @override
  bool changeDefaultName(String name) {
    try {
      jsonhandler.saveUserName(name);
    }
    catch (exception){
      print('Could not save user name in file.');
      return false;
    }
    _defaultName = name;
    return true;
  }

  @override
  Future<String> getDefaultName() async {
    try{
      _defaultName = await jsonhandler.readUserName();
    }
    catch (exception)
    {
      print('Could not read user name from file');
      print(exception.toString());
    }
    return _defaultName;
  }

  @override
  String getDefaultNameFromLocal() {
    return _defaultName;
  }
}
