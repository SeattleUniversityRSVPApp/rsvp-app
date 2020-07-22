import 'event.dart';

abstract class IEventWebService
{
  bool createEvent();
  bool editEvent();
  Event getEvent(String link);
}