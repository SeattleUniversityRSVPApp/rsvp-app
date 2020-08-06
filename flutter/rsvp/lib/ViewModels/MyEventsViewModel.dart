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

  void onLoad() async {
    var allEvents =  await _repository.getMyEvents();
    _repository.addMyEventsListener(() => notifyListeners());
    _events = allEvents.map((x) => EventViewModel(x)).toList();
  }

}
