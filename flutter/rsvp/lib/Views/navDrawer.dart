import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/NavDrawerViewModel.dart';
import 'package:rsvp/Views/createEvent.dart';
import 'package:rsvp/Views/joinEvent.dart';
import 'package:rsvp/Views/setting.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  NavDrawerViewModel _navDrawerViewModel;
  Future _viewModelLoadedFuture;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/pic1.png'),
                    radius: 35,
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  FutureBuilder(future: _viewModelLoadedFuture,
                    builder: (context, snapshot)  => Text(_navDrawerViewModel.userName,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  )],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[500],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Create Event'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateEvent(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Join Event'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => JoinEvent()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting()))
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _navDrawerViewModel = Provider.of<NavDrawerViewModel>(context);
    _viewModelLoadedFuture = _navDrawerViewModel.onLoad();
  }
}
