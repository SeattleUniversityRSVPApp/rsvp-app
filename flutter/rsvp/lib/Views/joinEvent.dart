import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/JoinEventViewModel.dart';

class JoinEvent extends StatefulWidget {
  @override
  _JoinEventState createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {
//  var _joinEventViewModel = JoinEventViewModel();
  JoinEventViewModel _joinEventViewModel;
  String _userName;
  String _eventLink;

  @override
  Widget build(BuildContext context) {
    bool joined;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find and Join an Event'),
      ),
      body: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              getEventLink(),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              getuserName(),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
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
                        onPressed: () => {
                          joined = _joinEventViewModel.joinEvent(_eventLink, _userName),
                          showAlertDialog(context, joined),
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
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        Text('Event Link: '),
        SizedBox(width: 10),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: TextField (
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

  Row getuserName() {
    _userName = _joinEventViewModel.getUsername();
    if(_userName == 'Unknown') {
      _userName = '';
    }
    return Row(
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        Text('User Name: '),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child:
            TextFormField (
              initialValue: _userName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Name'),
              onChanged: (text) {
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
  }
}

showAlertDialog(BuildContext context, bool joined) {
  Text title;
  Text message;

  if(joined) {
    title = Text('Success');
    message = Text('Event Successfully Joined.');
  } else {
    title = Text('Error');
    message = Text('Failed to join event. Please try again.');
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


