import 'package:flutter/material.dart';
import 'package:rsvp/pages/home.dart';
import 'package:rsvp/pages/createEvent.dart';
import 'package:rsvp/pages/eventDetails.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/CreateEvent': (context) => CreateEvent(),
      '/FullEventInfo': (context) => EventDetails(),
    },
  ));
}
