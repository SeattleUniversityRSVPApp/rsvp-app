import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class CreateEventViewModel extends ChangeNotifier {
  IEventRepository _repository;
  String _defaultCreatorName = "Unknown";
  var _createdSuccessful = true;

  CreateEventViewModel(this._repository);

  bool createEvent(String eventName, String eventDate, int minNum,
      String eventDescription, String eventLocation) {
    // TODO: if the creator name that is passed as an argument is empty then replace the default name as CreatorName.
    try {
      var dateTime = DateFormat.yMd().parseLoose(eventDate);
      var aNewEvent = _repository.createEvent(
          eventName, dateTime, minNum, eventDescription, eventLocation);
      // TODO: what should we do with aNewEvent object?
      _createdSuccessful = true;
    } catch (exception) {
      _createdSuccessful = false;
    }
    return _createdSuccessful;
  }
}
