import 'dart:core';

import 'event.dart';

abstract class IlocalData {
  Future<List<Event>> getCreatedEvents();
  String addCreatedEvents(Event newEvent);
  Future<List<Event>> getRespondedEvents();
  String addRespondedEvent(Event newEvent);
  Future<String> getDefaultName();
  String getDefaultNameFromLocal();
  bool changeDefaultName(String name);
}