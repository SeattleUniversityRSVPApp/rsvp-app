import 'event.dart';
import 'dart:core';

abstract class IlocalData {
  List<Event> getCreatedEvents();
  String addCreatedEvents(Event newEvent);
  List<Event> getRespondedEvents();
  String addRespondedEvent();
}