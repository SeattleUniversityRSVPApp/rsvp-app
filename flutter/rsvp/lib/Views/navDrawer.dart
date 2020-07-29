import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/Models/EventRepository.dart';
import 'package:rsvp/Models/MockEventService.dart';
import 'package:rsvp/ViewModels/CreateEventViewModel.dart';
import 'package:rsvp/Views/createEvent.dart';
import 'package:rsvp/Views/joinEvent.dart';
import 'package:rsvp/Views/setting.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(top:15),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/pic1.png'),
                    radius: 35,
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'JungBok Cho',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              /*image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg')
                ),*/
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Create Event'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (_) => CreateEventViewModel(EventRepository(MockEventService())),
                  child: CreateEvent(),
                ))
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Join Event'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => JoinEvent())
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Setting())
              )
            },
          ),
        ],
      ),
    );
  }
}
