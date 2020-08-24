import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/JoinEventViewModel.dart';

import 'eventDetails.dart';

class JoinEvent extends StatefulWidget {
  @override
  _JoinEventState createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {
  JoinEventViewModel _joinEventViewModel;
  String _eventLink;
  String _userName;

  @override
  Widget build(BuildContext context) {
    bool joined, foundEvent;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find and Join an Event'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              getEventLink(),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              getUserName(),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('View Event'),
                        onPressed: () async => {
                          foundEvent = _joinEventViewModel.getEventExist(_eventLink),
                          if(foundEvent) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EventDetails(
                                          event: _joinEventViewModel.getEvent(
                                              _eventLink),
                                        ))),
                          } else {
                            showAlertDialog(context, foundEvent, true),
                          }
                        }),
                    RaisedButton(
                        child: Text('Join Event'),
                        onPressed: () => {
                              joined =
                                  _joinEventViewModel.joinEvent(_eventLink, _userName),
                              showAlertDialog(context, joined, false),
                            }),
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
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        Text('Event Link: '),
        SizedBox(width: 10),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Link'),
            onChanged: (String text) {
              setState(() {
                _eventLink = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _eventLink = text;
              });
            },
          ),
        ),
      ],
    );
  }

  Row getUserName() {
    return Row(
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        Text('User Name: '),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: TextFormField(
            initialValue: _joinEventViewModel.getUsername(),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Name'),
            onChanged: (text) {
              setState(() {
                _userName = text;
              });
            },
            onSaved: (String text) {
              setState(() {
                _userName = text;
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
    _joinEventViewModel = Provider.of<JoinEventViewModel>(context);
    _userName = _joinEventViewModel.getUsername();
  }
}

showAlertDialog(BuildContext context, bool success, bool view) {
  Text title;
  Text message;
  if(!view) {
    if (success) {
      title = Text('Success');
      message = Text('Event Successfully Joined.');
    } else {
      title = Text('Error');
      message = Text('Failed to join event. Please try again.');
    }
  } else {
    if (!success) {
      title = Text('Error');
      message = Text('Failed to find the event. Please try again.');
    }
  }
  // set up the button
  Widget okButton = FlatButton(
    child: Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  var alert = AlertDialog(
    title: title,
    content: message,
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
