import 'package:flutter/material.dart';
import 'package:rsvp/event.dart';
import 'package:rsvp/pages/eventDetails.dart';

class EventCard extends StatelessWidget {

  final Event event;
  final Function delete;
  EventCard({this.event, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,16,12,8),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                EventDetails())
            );
            print('tapped');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                event.eventName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6,),
              Row(
                children: <Widget>[
                  Text(
                    event.eventDate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton.icon(
                        onPressed: () {delete();},
                        icon: Icon(Icons.delete),
                        label: Text('Delete'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}