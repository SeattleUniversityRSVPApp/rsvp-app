import 'package:flutter/material.dart';
import 'package:rsvp/ViewModels/MyEventsViewModel.dart';
import 'package:rsvp/Views/navDrawer.dart';
import 'package:rsvp/Views/eventDetails.dart';
import 'package:rsvp/Models/event.dart';

class MyHomePage extends StatefulWidget {
  List<Event> _events;

  MyHomePage(this._events);

  @override
  _MyHomePageState createState() => _MyHomePageState(_events);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Event> _events;
  MyEventsViewModel _MyEventsViewModelObj;

  _MyHomePageState(this._events);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Container(
        child: NavDrawer(),
        width: 235,
      ),
      appBar: AppBar(
        title: Text('RSVP'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                title: Text(_events[index].name),
                subtitle: Text(_events[index].date),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventDetails(
                                event: _events[index],
                                delete: () {
                                  setState(() {
                                    _events.remove(_events[index]);
                                  });
                                },
                              )));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
