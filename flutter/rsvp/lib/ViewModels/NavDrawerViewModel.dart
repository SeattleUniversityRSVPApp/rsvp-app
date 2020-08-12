import 'package:flutter/material.dart';
import 'package:rsvp/Models/IEventRepository.dart';

class NavDrawerViewModel extends ChangeNotifier {
  String _customerName;
  final IEventRepository _repository;

  NavDrawerViewModel(this._repository);

  getCustomerName() {
    _customerName = _repository.getCustomerName();
    return (_customerName != null && _customerName.isNotEmpty)
        ? _customerName
        : 'Unknown';
  }
}
