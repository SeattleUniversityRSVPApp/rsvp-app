import 'package:flutter/foundation.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class JoinEventViewModel extends ChangeNotifier{
  IEventRepository _repository;

  JoinEventViewModel(this._repository);

  bool joinEvent(String link, String userName) {
    var joinedEvent = _repository.joinEvent(link, userName);
    if(joinedEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  String getUsername() {
    return _repository.getUserNameFromLocal();
  }
}