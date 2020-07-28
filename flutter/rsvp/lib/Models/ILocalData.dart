import 'event.dart';
import 'dart:core';

abstract class IlocalData {
  List<Event> getCreatedEvents();
  String addCreatedEvents();
  List<Event> getRespondedEvents();
  String addRespondedEvent();
}