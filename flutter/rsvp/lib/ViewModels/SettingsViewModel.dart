import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class SettingsViewModel extends ChangeNotifier {
  final IEventRepository _eventRepositoryObj;

  SettingsViewModel(this._eventRepositoryObj);

  bool save(String name) {
    _eventRepositoryObj.setCustomerName(name);
    // TODO: if an exception thrown by the repository or something happened, so the name didn't save, this method should return false. Otherwise return true.
    return true;
  }

  String getName() {
    return _eventRepositoryObj.getCustomerName();
  }
}
