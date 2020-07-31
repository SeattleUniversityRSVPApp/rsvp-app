import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:rsvp/Models/event.dart';
import 'ILocalData.dart';
import 'JsonHandler.dart';

class LocalData implements IlocalData {
  static List<Event> createdEventsList = [];
  static List<Event> respondedEventsList = [];
  String defaultName = null;
  String userId;

  @override
  String addCreatedEvents(Event newEvent) {
    createdEventsList.add(newEvent);
    return null;
  }

  @override
  List<Event> getCreatedEvents() {
    createdEventsList = [
      Event('Walk with dogs', '08/16/2020'),
      Event('Finish this project', '09/08/2020'),
    ];
    return createdEventsList;
  }

  @override
  String addRespondedEvent() {
    return null;
  }

  @override
  List<Event> getRespondedEvents() {
    respondedEventsList = [
      Event('Visit Museum', '10/28/2020'),
      Event('Find internship', '11/17/2020'),
      Event('Party Night', '12/31/2020'),
    ];
    return respondedEventsList;
  }

  List<String> saveEvents() {
    return null;
  }

}