import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class SettingsViewModel extends ChangeNotifier {
  final IEventRepository _eventRepositoryObj;

  SettingsViewModel(this._eventRepositoryObj);

  bool save(String name) {
    _eventRepositoryObj.setUserName(name);
    _eventRepositoryObj.addChangeUserNameListener(() => notifyListeners());
    // TODO: if an exception thrown by the repository or something happened, so the name didn't save, this method should return false. Otherwise return true.
    return true;
  }

  Future<String> getName() {
    return _eventRepositoryObj.getUserName();
  }
}
