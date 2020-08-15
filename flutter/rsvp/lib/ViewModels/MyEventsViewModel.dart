import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';
import 'package:rsvp/Models/event.dart';
import 'package:rsvp/ViewModels/EventViewModel.dart';

class MyEventsViewModel extends ChangeNotifier {
  List<EventViewModel> _events = [];

  IEventRepository _repository;

  MyEventsViewModel(this._repository);

  openEventDetails() {}

  openCreateEvent() {}

  openJoinEvent() {}

  openSettings() {}

  List<EventViewModel> get events => _events;

  Future onLoad() async {
    var createdEvent = await _repository.getCreatedEvents();
    var respondentEvent = await _repository.getRespondentEvents();
    _repository.addMyEventsListener(() => notifyListeners());
    _events = createdEvent.map((x) => EventViewModel(x, true)).toList();
    _events += respondentEvent.map((x) => EventViewModel(x, false)).toList();
  }

}
