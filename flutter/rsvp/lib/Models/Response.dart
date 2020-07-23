class Response {
  String _eventLink;
  String _id;
  String _respondentName;
  bool _attending;


  String get eventLink => _eventLink;

  set eventLink(String eventLink) {
    _eventLink = eventLink;
  }


  String get id => _id;

  set id(String id) {
    _id = id;
  }


  String get respondentName => _respondentName;

  set respondentName(String respondentName) {
    _respondentName = respondentName;
  }


  bool get attending => _attending;

  set attending(bool attending) {
    _attending = attending;
  }

}