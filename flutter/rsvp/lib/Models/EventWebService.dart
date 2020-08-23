import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rsvp/Models/IEventWebServcie.dart';
import 'package:rsvp/Models/event.dart';

class EventWebService implements IEventWebService {
  //static final String baseURL = 'https://seattleu.rsvp.edu/';
  static final String baseURL = 'http://localhost:8080/';

  @override
  Event createEvent(String eventName, String creatorName, DateTime eventDate,
      int minNum, String eventDescription, String eventLocation) {
    // TODO: implement createEvent
    return null;
  }

  @override
  bool editEvent() {
    // TODO: implement editEvent
    return false;
  }

  @override
  Future<Event> getEvent(String link) async {
    final response = await http.get(baseURL + 'event/' + link);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return Event.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to get the event: ' + link);
    }
  }

  @override
  bool joinEvent(String link, String name) {
    // TODO: implement joinEvent
    return false;
  }

  @override
  bool cancelEvent(String link) {
    // TODO: implement cancelEvent
    return false;
  }
}
