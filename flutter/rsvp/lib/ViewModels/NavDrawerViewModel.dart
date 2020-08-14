import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class NavDrawerViewModel extends ChangeNotifier {
  String _userName;
  final IEventRepository _repository;

  NavDrawerViewModel(this._repository);

  String get userName => _userName;

  Future onLoad() async
  {
    _userName = await _repository.getUserName();
    _repository.addChangeUserNameListener(() => notifyListeners());
  }
}
