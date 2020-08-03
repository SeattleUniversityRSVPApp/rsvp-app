import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/Models/EventRepository.dart';
import 'package:rsvp/Models/MockEventService.dart';
import 'package:rsvp/ViewModels/CreateEventViewModel.dart';
import 'package:rsvp/ViewModels/MyEventsViewModel.dart';
import 'package:rsvp/ViewModels/SettingsViewModel.dart';
import 'package:rsvp/Views/home.dart';

import 'Models/event.dart';

void main() {
  var repository = EventRepository(MockEventService());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CreateEventViewModel(repository),
      ),
      ChangeNotifierProvider(
        create: (_) => MyEventsViewModel(repository),
      ),
      //TODO: add a ChangeNotifierProvider for EventDetailsViewModel.
      //TODO: add a ChangeNotifierProvider for JoinEventViewModel.
      //TODO: add a ChangeNotifierProvider for NavDrawerViewModel.
      ChangeNotifierProvider(
        create: (_) => SettingsViewModel(repository),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final List<Event> _events = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSVP App',
      initialRoute: '/',
      home: MyHomePage(),
//        routes: {
//      '/': (context) => MyHomePage(events),
//      '/loading': (context) => Loading(),
//      '/CreateEvent': (context) => CreateEvent(),
//      '/JoinEvent': (context) => JoinEvent(),
//      '/FullEventInfo': (context) => EventDetails(),
    );
  }
}
