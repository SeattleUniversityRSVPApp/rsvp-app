import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class CreateEventViewModel extends ChangeNotifier {
  IEventRepository _repository;
  final String UNKNOWN = 'Unknown';
  var _createdSuccessful = true;

  CreateEventViewModel(this._repository);

  bool createEvent(String eventName, String creatorName, String eventDate, int minNum,
      String eventDescription, String eventLocation) {
    try {
      var dateTime = DateFormat.yMd().parseLoose(eventDate);
      if(creatorName == '') {
        var aNewEvent = _repository.createEvent(
            eventName, UNKNOWN, dateTime, minNum, eventDescription, eventLocation);
      } else {
        var aNewEvent = _repository.createEvent(
            eventName, creatorName, dateTime, minNum, eventDescription, eventLocation);
      }

      // TODO: what should we do with aNewEvent object?
      _createdSuccessful = true;
    } catch (exception) {
      _createdSuccessful = false;
    }
    return _createdSuccessful;
  }

  String getUsername() {
    return _repository.getUserNameFromLocal();
  }
}
