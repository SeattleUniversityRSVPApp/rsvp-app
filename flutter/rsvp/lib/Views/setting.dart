import 'package:flutter/material.dart';
import 'package:rsvp/ViewModels/SettingsViewModel.dart';
import 'loading.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  String name;

  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingViewModel = new SettingsViewModel();
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              getName(),
              RaisedButton(
                  child: Text('Save'),
                  onPressed: () async => {
                  settingViewModel.save(name),
                    reload(),
                    Navigator.pop(context),
                  })
            ],
          ),
        ),
      ),
    );
  }
  void reload() {
    runApp(MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
      },
    ));
  }

  Row getName() {
    return Row(
      children: <Widget>[
        Text(' Enter Name: '),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: ' type your name '),
            onChanged: (String text) {
              setState(() {
                name = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                name = text;
              });
            },
          ),
        ),
      ],
    );
  }
}
