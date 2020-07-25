import 'package:flutter/material.dart';
import 'package:rsvp/Views/home.dart';
import 'package:rsvp/Views/createEvent.dart';
import 'package:rsvp/Views/eventDetails.dart';
import 'package:rsvp/Views/loading.dart';
import 'package:rsvp/Views/joinEvent.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/loading',
    routes: {
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
      '/CreateEvent': (context) => CreateEvent(),
      '/JoinEvent': (context) => JoinEvent(),
      '/FullEventInfo': (context) => EventDetails(),
    },
  ));
}
