class Response {
  String _eventLink;
  int _id;
  String _respondentName;
  bool _attending;

  Response(
      String eventLink,
      int id,
      String respondentName,
      bool attending) {
    _eventLink = eventLink;
    _id = id;
    _respondentName = respondentName;
    _attending = attending;
  }


  String get eventLink => _eventLink;

  set eventLink(String eventLink) {
    _eventLink = eventLink;
  }


  int get id => _id;

  set id(int id) {
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