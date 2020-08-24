import 'package:flutter/foundation.dart';
import 'package:rsvp/Models/IEventRepository.dart';
import 'package:rsvp/ViewModels/EventViewModel.dart';

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

  bool getEventExist(String link) {
    var foundEvent = _repository.getEvent(link);
    if(foundEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  EventViewModel getEvent(String link) {
    var event = _repository.getEvent(link);
    if(event == null) {
      return null;
    } else {
      return EventViewModel(event, true);
    }
  }
}