import 'package:flutter/material.dart';
import 'package:rsvp/Models/event.dart';
import 'package:rsvp/ViewModels/EventViewModel.dart';

class EventDetails extends StatelessWidget {
  final EventViewModel event;
  final Function delete;

  EventDetails({this.event, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          centerTitle: true,
          title: Text(
            event.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    event.date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton.icon(
                        onPressed: () async {
                          await delete();
                          Navigator.pop(context);
                        },
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
