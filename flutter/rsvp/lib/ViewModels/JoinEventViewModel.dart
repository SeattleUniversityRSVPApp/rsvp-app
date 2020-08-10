import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rsvp/Models/EventRepository.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class JoinEventViewModel extends ChangeNotifier{
  IEventRepository _repository;
  var _joinedSuccess = true;

//  JoinEventViewModel(this._repository);

  bool joinEvent(String link, String respondentName) {
    try {
      _repository.joinEvent(link, respondentName);
      _joinedSuccess = true;
    } catch (exception) {
      _joinedSuccess = false;
    }
    return _joinedSuccess;
  }

  String getUsername() {
    return _repository.getCustomerName();
  }
}