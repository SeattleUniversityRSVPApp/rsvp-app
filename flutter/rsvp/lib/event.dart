class Event {
  String _name;
  String _date;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  Event(this._name, this._date);
}
