import 'Response.dart';
import 'event.dart';

class FakeData {
  static final urlTemplate = 'https://www.my-test-unique-url-';
  static int eventIdCounter = 0;
  static int responseIdCounter = 1;
  static final List<Event> fakeEventData = [
    Event(urlTemplate + (eventIdCounter++).toString(), 'Basketball Game', '',
        '', DateTime.parse('2020-08-03'), '', 0, true),
    Event(urlTemplate + (eventIdCounter++).toString(), 'Walk with dogs', '',
        '', DateTime.parse('2020-08-16'), '', 0, true),
    Event(urlTemplate + (eventIdCounter++).toString(), 'Finish this project',
        '', '', DateTime.parse('2020-09-08'), '', 0, true),
    Event(urlTemplate + (eventIdCounter++).toString(), 'Visit Museum', '', '',
        DateTime.parse('2020-10-28'), '', 0, true),
    Event(urlTemplate + (eventIdCounter++).toString(), 'Find internship', '',
        '', DateTime.parse('2020-11-17'), '', 0, true),
    Event(urlTemplate + (eventIdCounter++).toString(), 'Party Night', '', '',
        DateTime.parse('2020-12-31'), '', 0, true),
  ];
  static final List<Response> fakeResponseData = [
    Response(fakeEventData[0].link, responseIdCounter++,'Leila',true),
    Response(fakeEventData[1].link, responseIdCounter++, 'Cho', false),
    Response(fakeEventData[2].link, responseIdCounter++, 'Grey', false),
  ];
}
