class Event {
  String _link;
  String _name;
  DateTime _dateTime;
  String _description;
  String _creator;
  String _location;
  int _minNum;
  bool _status;

  Map<dynamic, dynamic> toJson() => {
    'name': _name,
    'date': _dateTime,
  };

  Event.fromJson(Map<dynamic, dynamic> json) {
    _name = json['name'] as String;
    _dateTime = DateTime.parse(json['_date'] as String);
  }

  Event(
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
