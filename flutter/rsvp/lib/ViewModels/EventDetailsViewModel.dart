import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class EventDetailsViewModel extends ChangeNotifier {
  IEventRepository _repositoryObj;
  EventDetailsViewModel(this._repositoryObj);

  bool cancelEvent(String link) {
    _repositoryObj.cancelEvent(link);
    _repositoryObj.addMyEventsListener(() => notifyListeners());
    return true;
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
    _repositoryObj.deleteEvent(link);
    _repositoryObj.addMyEventsListener(() => notifyListeners());
    return true;
  }
}
