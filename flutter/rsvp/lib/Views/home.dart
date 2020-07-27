import 'package:flutter/material.dart';
import 'package:rsvp/Views/navDrawer.dart';
import 'package:rsvp/Views/eventDetails.dart';
import 'package:rsvp/Models/event.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map rcvdData = {};

  @override
  Widget build(BuildContext context) {
    rcvdData = (rcvdData.isNotEmpty ? rcvdData : ModalRoute.of(context).settings.arguments) as Map;

    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(
        primarySwatch: Colors.grey,
      ),*/
      home: MyHomePage(rcvdData['eventList']),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var events;

  MyHomePage(this.events);

  @override
  _MyHomePageState createState() => _MyHomePageState(events as List<Event>);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Event> events;   /*[
    Event('Walk with dogs', '08/16/2020'),
    Event('Finish this project', '09/08/2020'),
    Event('Visit Museum', '10/28/2020'),
    Event('Find internship', '11/17/2020'),
    Event('Party Night', '12/31/2020'),
  ];*/

  _MyHomePageState(this.events);

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
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                title: Text(events[index].name),
                subtitle: Text(events[index].date),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                      EventDetails(event: events[index], delete: () {
                        setState(() {
                          events.remove(events[index]);
                        });
                      },
                    )
                  ));
                },
              ),
            ),
          );
        },
      ),
    );
  }

}
