import 'package:flutter/material.dart';
import 'package:rsvp/Views/home.dart';

import 'Models/event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Event> _events = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSVP App',
      initialRoute: '/',
      home: MyHomePage(_events),
//        routes: {
//      '/': (context) => MyHomePage(events),
//      '/loading': (context) => Loading(),
//      '/CreateEvent': (context) => CreateEvent(),
//      '/JoinEvent': (context) => JoinEvent(),
//      '/FullEventInfo': (context) => EventDetails(),
    );
  }
}
