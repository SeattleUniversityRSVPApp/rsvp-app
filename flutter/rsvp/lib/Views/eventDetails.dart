import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/EventDetailsViewModel.dart';
import 'package:rsvp/ViewModels/EventViewModel.dart';
import 'package:rsvp/Views/editEvent.dart';

class EventDetails extends StatefulWidget {
  final EventViewModel event;
//  final Function delete;

  EventDetails({this.event /*, this.delete*/});

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  EventDetailsViewModel _eventDetailsViewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          centerTitle: true,
          title: Text(
            widget.event.name,
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
              SizedBox(
                height: 12,
              ),
              getEventName(),
              SizedBox(
                height: 12,
              ),
              getCreatorName(),
              SizedBox(
                height: 12,
              ),
              getMinNum(),
              SizedBox(
                height: 12,
              ),
              getLocation(),
              SizedBox(
                height: 12,
              ),
              getDescription(),
              SizedBox(
                height: 12,
              ),
              CreatedOrRespondent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget getEventName() {
    return Row(
      children: <Widget>[
        Text(
          'Event Date: ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.event.date,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget getCreatorName() {
    return Row(
      children: <Widget>[
        Text(
          'Event Creator: ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.event.creator,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget getMinNum() {
    return Row(
      children: <Widget>[
        Text(
          'Minimum Number: ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.event.minNum.toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget getLocation() {
    return Row(
      children: <Widget>[
        Text(
          'Event Location: ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.event.location,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget getDescription() {
    return Row(
      children: <Widget>[
        Text(
          'Event Description: ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.event.description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget CreatedOrRespondent(BuildContext context) {
    if (widget.event.isCreated) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FlatButton.icon(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEvent(),
                      ));
                },
                icon: Icon(
                  Icons.create,
                  color: Colors.green,
                ),
                label: Text('Edit'),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton.icon(
                onPressed: () async {
                  await _eventDetailsViewModel.cancelEvent(widget.event.link);
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                label: Text('Cancel'),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FlatButton.icon(
                onPressed: () async {
//                  await delete();
                },
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                label: Text('Join'),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton.icon(
                onPressed: () async {
//                  await delete();
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                label: Text('Absent'),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: FlatButton.icon(
                onPressed: () async {
                  await _eventDetailsViewModel.deleteEvent(widget.event.link);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _eventDetailsViewModel = Provider.of<EventDetailsViewModel>(context);
  }
}
