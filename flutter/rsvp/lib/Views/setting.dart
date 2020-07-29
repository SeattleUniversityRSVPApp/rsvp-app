
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  String name;

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pop(context),
                  })
            ],
          ),
        ),
      ),
    );
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
