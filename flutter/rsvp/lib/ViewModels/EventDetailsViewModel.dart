import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class EventDetailsViewModel extends ChangeNotifier {
  IEventRepository _repositoryObj;
  EventDetailsViewModel(this._repositoryObj);

  bool cancelEvent(String link) {
    var canceledEvent = _repositoryObj.cancelEvent(link);
    if (canceledEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  bool editEvent(String link, DateTime date, String location) {
    var editdEvent = _repositoryObj.editEvent(link, date, location);
    if (editdEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  bool deleteEvent(String link) {
    return _repositoryObj.deleteEvent(link);
  }

}
