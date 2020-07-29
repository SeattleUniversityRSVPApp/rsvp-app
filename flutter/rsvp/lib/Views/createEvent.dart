import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/CreateEventViewModel.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String eventName;
  String eventDate;
  int minNum;
  String eventDescription;
  String eventLocation;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<CreateEventViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              getEventName(),
              getEventDate(),
              getMinNum(),
              getEventDescription(),
              getEventLocation(),
              RaisedButton(
                  child: Text('Add Event'),
                  onPressed: () async => {
                        vm.createEvent(eventName, eventDate, minNum,
                            eventDescription, eventLocation),
                        Navigator.pop(context),
                      })
            ],
          ),
        ),
      ),
    );
  }

  Row getEventName() {
    return Row(
      children: <Widget>[
        Text('Event name: '),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Title'),
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

  Row getEventDate() {
    return Row(
      children: <Widget>[
        Text('Event date: '),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Date'),
            onChanged: (String text) {
              setState(() {
                eventDate = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                eventDate = text;
              });
            },
          ),
        ),
      ],
    );
  }

  Row getMinNum() {
    return Row(
      children: <Widget>[
        Text('Event Min Num: '),
        Container(
          width: 100,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Num'),
            onChanged: (String text) {
              setState(() {
                minNum = int.parse(text);
              });
            },
            onSubmitted: (String text) {
              setState(() {
                minNum = int.parse(text);
              });
            },
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ],
    );
  }

  Row getEventDescription() {
    return Row(
      children: <Widget>[
        Text('Event description: '),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Description'),
            onChanged: (String text) {
              setState(() {
                eventDescription = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                eventDescription = text;
              });
            },
          ),
        ),
      ],
    );
  }

  Row getEventLocation() {
    return Row(
      children: <Widget>[
        Text('Event location: '),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Location'),
            onChanged: (String text) {
              setState(() {
                eventLocation = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                eventLocation = text;
              });
            },
          ),
        ),
      ],
    );
  }
}
