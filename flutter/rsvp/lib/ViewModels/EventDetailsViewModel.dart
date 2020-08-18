import 'package:flutter/cupertino.dart';
import 'package:rsvp/Models/IEventRepository.dart';
import 'package:rsvp/Models/event.dart';

class EventDetailsViewModel extends ChangeNotifier {
  IEventRepository repositoryObj;
  EventDetailsViewModel(this.repositoryObj);

  bool cancelEvent(String link) {
    var canceledEvent = repositoryObj.cancelEvent(link);
    if (canceledEvent == null) {
      return false;
    } else {
      return true;
    }
  }

  bool editEvent(String link, DateTime date, String location) {
    var editdEvent = repositoryObj.editEvent(link, date, location);
    if (editdEvent == null) {
      return false;
    } else {
      return true;
    }
  }
}
