import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:rsvp/Models/event.dart';
import 'ILocalData.dart';
import 'JsonHandler.dart';

class LocalData implements IlocalData {

  String defaultName = null;
  String userId;

  @override
  String addCreatedEvents() {
    return null;
  }

  @override
  List<String> getCreatedEvents() {
    return null;
  }

  @override
  String addRespondedEvent() {
    return null;
  }

  @override
  List<String> getRespondedEvents() {
    return null;
  }

  List<String> saveEvents() {
    return null;
  }

  Future<List<String>> loadEvents() async {
    /*var localData = <String>['name: Walk with dogs, date: 08/16/2020',
    'name: Finish this project, date: 09/08/2020',
    'name: Visit Museum, date: 10/28/2020',
    'name: Find internship, date: 11/17/2020',
    'name: Party Night, date: 12/31/2020'
    ];*/


    return <String>['name: Walk with dogs, date: 08/16/2020',
      'name: Finish this project, date: 09/08/2020',
      'name: Visit Museum, date: 10/28/2020',
      'name: Find internship, date: 11/17/2020',
      'name: Party Night, date: 12/31/2020'
    ];
  }

}