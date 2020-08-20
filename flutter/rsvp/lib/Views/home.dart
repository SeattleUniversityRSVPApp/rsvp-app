import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/MyEventsViewModel.dart';
import 'package:rsvp/Views/navDrawer.dart';
import 'package:rsvp/Views/eventDetails.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyEventsViewModel _MyEventsViewModelObj;

  Future _viewModelLoadedFuture;

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
        body: FutureBuilder(
          future: _viewModelLoadedFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong.'),
              );
            } else {
              return buildListView(context);
            }
          },
        ));
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: _MyEventsViewModelObj.events
          .map((anEvent) => ListTile(
                title: Text(anEvent.name),
                subtitle: Text(anEvent.date),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventDetails(
                                event: anEvent,
                                delete: () {
                                  setState(() =>
                                      _MyEventsViewModelObj.events.remove(anEvent)
                                  );
                                },
                              )));
                },
              ))
          .toList(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _MyEventsViewModelObj = Provider.of<MyEventsViewModel>(context);
    _viewModelLoadedFuture = _MyEventsViewModelObj.onLoad();
  }
}
