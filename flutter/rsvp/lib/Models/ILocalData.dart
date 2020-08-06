import 'event.dart';
import 'dart:core';

abstract class IlocalData {
  Future<List<Event>> getCreatedEvents();
  String addCreatedEvents(Event newEvent);
  Future<List<Event>> getRespondedEvents();
  String addRespondedEvent(Event newEvent);
  String getDefaultName();
  bool changeDefaultName(String name);
}