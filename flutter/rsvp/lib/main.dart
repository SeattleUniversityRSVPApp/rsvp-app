import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/Models/EventRepository.dart';
import 'package:rsvp/Models/MockEventService.dart';
import 'package:rsvp/Models/MockLocalData.dart';
import 'package:rsvp/ViewModels/CreateEventViewModel.dart';
import 'package:rsvp/ViewModels/JoinEventViewModel.dart';
import 'package:rsvp/ViewModels/MyEventsViewModel.dart';
import 'package:rsvp/ViewModels/SettingsViewModel.dart';
import 'package:rsvp/Views/home.dart';

import 'Models/LocalData.dart';
import 'Models/event.dart';

void main() {
  var localData = MockLocalData(); // Uncomment to use fake data
//  var localData = LocalData();  // Uncomment to use real local data
  var repository = EventRepository(MockEventService(), localData);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CreateEventViewModel(repository),
      ),
      ChangeNotifierProvider(
        create: (_) => MyEventsViewModel(repository),
      ),
      //TODO: add a ChangeNotifierProvider for EventDetailsViewModel.
      ChangeNotifierProvider(
        create: (_) => JoinEventViewModel(repository),
      ),
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
