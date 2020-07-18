import 'package:flutter/material.dart';
import 'package:rsvp/pages/navDrawer.dart';
import 'package:rsvp/event.dart';
import 'package:rsvp/eventCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(
        primarySwatch: Colors.grey,
      ),*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Event> events = [
    Event('Walk with dogs', '07/20/2020'),
    Event('Visit Museum', '08/31/2020'),
    Event('Party Night', '12/31/2020')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        child: NavDrawer(),
        width: 235,
      ),
      appBar: AppBar(
        title: Text('RSVP'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: events
              .map((event) => EventCard(
                  event: event,
                  delete: () {
                    setState(() {
                      events.remove(event);
                    });
                  }))
              .toList(),
        ),
      ),
    );
  }
}
