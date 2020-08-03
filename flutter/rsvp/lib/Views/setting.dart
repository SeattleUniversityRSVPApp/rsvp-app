import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/SettingsViewModel.dart';
import 'loading.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String _name;
  SettingsViewModel _settingViewModel;

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
              _getName(),
              RaisedButton(
                  child: Text('Save'),
                  onPressed: () async => {
                        _settingViewModel.save(_name),
                        //reload(),
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

  Row _getName() {
    return Row(
      children: <Widget>[
        Text(' Enter Name: '),
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: ' type your name '),
            onChanged: (String text) {
              setState(() {
                _name = text;
              });
            },
            onSubmitted: (String text) {
              setState(() {
                _name = text;
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
    _settingViewModel = Provider.of<SettingsViewModel>(context);
    _name = _settingViewModel.getName();
  }
}
