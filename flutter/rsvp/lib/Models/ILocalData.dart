import 'event.dart';
import 'dart:core';

abstract class IlocalData {
  List<String> getCreatedEvents();
  String addCreatedEvents();
  List<String> getRespondedEvents();
  String addRespondedEvent();
}