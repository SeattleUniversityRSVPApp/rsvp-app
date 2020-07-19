import 'package:flutter/material.dart';
import 'package:rsvp/pages/home.dart';
import 'package:rsvp/pages/createEvent.dart';
import 'package:rsvp/pages/eventDetails.dart';
import 'package:rsvp/pages/loading.dart';
import 'package:rsvp/pages/joinEvent.dart';

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
