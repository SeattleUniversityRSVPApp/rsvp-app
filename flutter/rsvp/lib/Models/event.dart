class Event {
  String _link;
  String _name;
  DateTime _dateTime;
  String _description;
  String _creator;
  String _location;
  int _minNum;
  bool _status;
  bool _isCreatedEvent;

  Map toJson() => {
    'link': _link,
    'name': _name,
    'date': dateTime.toString(),
    'description': _description,
    'creator': _creator,
    'location': _location,
    'minNum': minNum.toString(),
    'status': status.toString(),
    'isCreatedEvent' : isCreatedEvent.toString(),
  };

  factory Event.fromJson(dynamic json) {
    return Event(json['link'] as String, json['name'] as String, json['creator'] as String,
        json['description'] as String, DateTime.parse(json['date'] as String),
        json['location'] as String, json['minNum'] as int, json['status'] as bool,
        json['isCreatedEvent'] as bool);
  }

  Event(
      String link,
      String name,
      String creator,
      String description,
      DateTime dateTime,
      String location,
      int minNum,
      bool status,
      bool isCreatedEvent) {
    _link = link;
    _name = name;
    _creator = creator;
    _description = description;
    _dateTime = dateTime;
    _location = location;
    _minNum = minNum;
    _status = status;
    _isCreatedEvent = isCreatedEvent;
  }

  String get link => _link;

  String get name => _name;

  int get minNum => _minNum;

  String get creator => _creator;

  DateTime get dateTime => _dateTime;

  String get location => _location;

  bool get status => _status;

  String get description => _description;

  bool get isCreatedEvent => _isCreatedEvent;

  set isCreatedEvent(bool value) {
    _isCreatedEvent = value;
  }

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
