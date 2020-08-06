import 'package:flutter/material.dart';

import 'event.dart';

abstract class IEventRepository {
  Event createEvent(String eventName, DateTime eventDate, int minNum,
      String eventDescription, String eventLocation);

  bool editEvent(String link, DateTime date, String location);

  Event getEvent(String link);

  Future<List<Event>> getMyEvents();

  Event cancelEvent(String link);

  Event joinEvent(String link, String respondentName);

  String getCustomerName();

  bool setCustomerName(String name);

  void addMyEventsListener(VoidCallback listener);

}
