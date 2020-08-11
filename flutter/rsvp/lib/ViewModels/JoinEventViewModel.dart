import 'package:flutter/foundation.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class JoinEventViewModel extends ChangeNotifier{
  IEventRepository _repository;

  JoinEventViewModel(this._repository);

  bool joinEvent(String link, String respondentName) {
    var joinedEvent = _repository.joinEvent(link, respondentName);
    if(joinedEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  String getUsername() {
    return _repository.getCustomerName();
  }
}