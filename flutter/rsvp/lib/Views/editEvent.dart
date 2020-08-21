import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/CreateEventViewModel.dart';
import 'package:rsvp/ViewModels/EventDetailsViewModel.dart';
import 'package:rsvp/ViewModels/EventViewModel.dart';

class EditEvent extends StatefulWidget {
  final EventViewModel event;

  const EditEvent({Key key, this.event}) : super(key: key);
  @override
  EditEventState createState() => EditEventState();
}

class EditEventState extends State<EditEvent> {
  EventDetailsViewModel _eventDetailsViewModel;
  CreateEventViewModel _createEventViewModel;
  String _eventName;
  String _creatorName;
  String _eventDate;
  int _minNum;
  String _eventDescription;
  String _eventLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              getEventName(),
              getCreatorName(),
              getEventDate(),
              getMinNum(),
              getEventDescription(),
              getEventLocation(),
              RaisedButton(
                  child: Text('Update Event'),
                  onPressed: () => {
//                        _eventDetailsViewModel.editEvent(
//                            _eventName,
//                            _creatorName,
//                            _eventDate.substring(0, _eventDate.length - 1),
//                            _minNum,
//                            _eventDescription,
//                            _eventLocation),
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
                _eventName = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _eventName = text;
              });
            },
          ),
        ),
      ],
    );
  }

  Row getCreatorName() {
    return Row(
      children: <Widget>[
        Text('Creator name: '),
        Container(
          width: 200,
          child: TextFormField(
            initialValue: _createEventViewModel.getUsername(),
            decoration: InputDecoration.collapsed(hintText: 'Name'),
            onChanged: (String text) {
              setState(() {
                _creatorName = text;
              });
            },
            onSaved: (String text) {
              setState(() {
                _creatorName = text;
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
            decoration: InputDecoration.collapsed(hintText: 'm/d/y'),
            onChanged: (String text) {
              setState(() {
                _eventDate = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _eventDate = text;
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
                _minNum = int.parse(text);
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _minNum = int.parse(text);
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
                _eventDescription = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _eventDescription = text;
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
                _eventLocation = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _eventLocation = text;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _createEventViewModel = Provider.of<CreateEventViewModel>(context);
    _creatorName = _createEventViewModel.getUsername();
  }
}
