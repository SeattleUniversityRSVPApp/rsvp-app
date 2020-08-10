import 'package:flutter/material.dart';
import 'package:rsvp/ViewModels/JoinEventViewModel.dart';

class JoinEvent extends StatefulWidget {
  @override
  _JoinEventState createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {
  JoinEventViewModel _joinEventViewModel;
  String _eventName;
  String _eventLink;

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
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              getEventLink(),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              getEventName(),
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
                          // how to make _joinEventViewModel not null here?
                          _joinEventViewModel.joinEvent(_eventLink, _eventName),
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

  Row getEventName() {
    return Row(
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        Text('Event Name: '),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: TextField (
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Name'),
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

//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    _joinEventViewModel = Provider.of<JoinEventViewModel>(context);
//  }

}


