import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsvp/ViewModels/SettingsViewModel.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  SettingsViewModel _settingViewModel;
  Future _viewModelLoadedFuture;

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
                  //This async doesn't work here! It doesn't have any await inside the onPressed method.
                  onPressed: () async => {
                        _settingViewModel.save(),
                        //reload(),
                        Navigator.pop(context),
                      })
            ],
          ),
        ),
      ),
    );
  }

  Row _getName() {
    return Row(
      children: <Widget>[
        Text(' Enter Name: '),
        Container(
          width: 200,
          child: FutureBuilder(future: _viewModelLoadedFuture, builder: (context,snapshot) =>
            TextField(decoration: InputDecoration.collapsed(hintText: _settingViewModel.userName),
              onChanged: (String text)
              {
                _settingViewModel.userName = text;
              },
              onSubmitted: (String text)
              {
                _settingViewModel.userName = text;
              },
          ),
         ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _settingViewModel = Provider.of<SettingsViewModel>(context);
    _viewModelLoadedFuture = _settingViewModel.onLoad();
  }
}
