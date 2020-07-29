import 'package:flutter/foundation.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class CreateEventViewModel extends ChangeNotifier {
  String defaultCreatorName = "Unknown";
  IEventRepository _eventRepository;

  CreateEventViewModel(this._eventRepository);

  bool createEvent(String eventName, String eventDate, int minNum,
      String eventDescription, String eventLocation) {
    //if the creator name that is passed as an argument is empty then replace the default name as CreatorName.
    var aNewEvent = _eventRepository.createEvent(
        eventName, eventDate, minNum, eventDescription, eventLocation);
    //TODO: check if creation was successful then return true, otherwise return false.
    var createdSuccessful = true;
    return createdSuccessful;
  }
}
