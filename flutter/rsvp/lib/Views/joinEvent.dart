import 'package:flutter/material.dart';

class JoinEvent extends StatefulWidget {
  @override
  JoinEventState createState() => JoinEventState();
}

class JoinEventState extends State<JoinEvent> {
  String eventName;
  String eventLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find and Join an Event'),
      ),
      body: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              getEventLink(),
              SizedBox(height: 20),
              getEventName(),
              SizedBox(height: 50),
              Container(
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('View Event'),
                        onPressed: () async => {
                          // Go to view event page here?
                          Navigator.pop(context),
                        }
                    ),
                    RaisedButton(
                        child: Text('Join Event'),
                        onPressed: () async => {
                          // Go to join event page here?
                          Navigator.pop(context),
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row getEventLink() {
    return Row(
      children: <Widget>[
        SizedBox(width: 75),
        Text('Event Link: '),
        SizedBox(width: 5),
        Container(
          width: 200,
          child: TextField (
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Link'),
            onChanged: (String text) {
              setState(() {
                eventLink = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                eventLink = text;
              });
            },
          ),
        ),
      ],
    );
  }

  Row getEventName() {
    return Row(
      children: <Widget>[
        SizedBox(width: 70),
        Text('Event Name: '),
        Container(
          width: 200,
          child: TextField (
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Name'),
            onChanged: (String text) {
              setState(() {
                eventName = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                eventName = text;
              });
            },
          ),
        ),
      ],
    );
  }
}
