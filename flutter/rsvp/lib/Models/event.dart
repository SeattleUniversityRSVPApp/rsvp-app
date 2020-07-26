class Event {
  String _link;
  String _name;
  String _date; // Remove it later. Just use _dateTime
  DateTime _dateTime;
  String _description;
  String _creator;
  String _location;
  int _minNum;
  bool _status;

  Event(this._name, this._date); // Remove Later

  Event_Constructor(
      String link,
      String name,
      String creator,
      String description,
      DateTime dateTime,
      String location,
      int minNum,
      bool status) {
    _link = link;
    _name = name;
    _creator = creator;
    _description = description;
    _dateTime = dateTime;
    _location = location;
    _minNum = minNum;
    _status = status;
  }

  String get link => _link;

  String get name => _name;

  int get minNum => _minNum;

  String get creator => _creator;

  DateTime get dateTime => _dateTime;

  String get location => _location;

  bool get status => _status;

  String get description => _description;

  // Remove this later
  String get date => _date;

  set date(String value) {
    _date = value;
  } // Remove THis later

  set description(String value) {
    _description = value;
  }

  set link(String value) {
    _link = value;
  }

  set name(String value) {
    _name = value;
  }

  set minNum(int value) {
    _minNum = value;
  }

  set creator(String value) {
    _creator = value;
  }

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  set location(String value) {
    _location = value;
  }

  set status(bool value) {
    _status = value;
  }
}
