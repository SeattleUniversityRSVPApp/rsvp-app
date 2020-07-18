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
    Event('Walk with dogs', '08/16/2020'),
    Event('Finish this project', '09/08/2020'),
    Event('Visit Museum', '10/28/2020'),
    Event('Find internship', '11/17/2020'),
    Event('Party Night', '12/31/2020')
  ];

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
                      EventCard(event: events[index], delete: () {
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
