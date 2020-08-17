import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class SettingsViewModel extends ChangeNotifier {
  final IEventRepository _eventRepositoryObj;
  String _userName = '';

  String get userName => _userName;
  set userName(String value) {
    _userName = value;
  }

  SettingsViewModel(this._eventRepositoryObj);

  bool save() {
    _eventRepositoryObj.setUserName(_userName);
    _eventRepositoryObj.addChangeUserNameListener(() => notifyListeners());
    // TODO: if an exception thrown by the repository or something happened, so the name didn't save, this method should return false. Otherwise return true.
    return true;
  }

  Future onLoad() async {
    _userName = await _eventRepositoryObj.getUserName();
  }
}
