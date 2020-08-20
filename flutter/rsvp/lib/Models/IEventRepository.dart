import 'package:flutter/material.dart';
import 'event.dart';

abstract class IEventRepository {
  Event createEvent(String eventName, String creatorName, DateTime eventDate, int minNum,
      String eventDescription, String eventLocation);

  bool editEvent(String link, DateTime date, String location);

  Event getEvent(String link);

  Future<List<Event>> getCreatedEvents();

  Future<List<Event>> getRespondentEvents();

  Event cancelEvent(String link);

  bool deleteEvent(String link);

  Event joinEvent(String link, String respondentName);

  Future<String> getUserName();

  String getUserNameFromLocal();

  bool setUserName(String name);

  void addMyEventsListener(VoidCallback listener);

  void addChangeUserNameListener(VoidCallback listener);
}
