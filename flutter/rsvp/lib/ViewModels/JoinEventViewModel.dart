import 'package:flutter/foundation.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class JoinEventViewModel extends ChangeNotifier{
  IEventRepository _repository;

  String _userName;

  JoinEventViewModel(this._repository);

  bool joinEvent(String link) {
    var joinedEvent = _repository.joinEvent(link, _userName);
    if(joinedEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getUsername() async {
    _userName = await _repository.getUserName();
    return _userName;
  }

  void setUsername(String username) {
    _userName = username;
  }
}