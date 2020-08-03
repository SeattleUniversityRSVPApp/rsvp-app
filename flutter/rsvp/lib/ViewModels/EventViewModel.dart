import 'package:rsvp/Models/event.dart';
import 'package:intl/intl.dart';

class EventViewModel {
  Event _event;

  //the page viemodel gets events from repository and generate one eventViewModel for each event
  EventViewModel(this._event);

  String get link => _event.link;

  String get name => _event.name;

  String get creator => _event.creator;

  String get description => _event.description;

  int get minNum => _event.minNum;

  // TODO: (Remove this later) use this link to learn how to format date and time: https://medium.com/flutter-community/working-with-dates-in-dart-e81c70911811 this part: Extracting / parsing date in specific format
  // date is a computed property.
  String get date {
    if (_event.dateTime == null) {
      return '';
    }
    var localDateTime = _event.dateTime.toLocal();
    var formatter = DateFormat('yMMMMEEEEd'); //YEAR_MONTH_WEEKDAY_DAY
    /// Formatting dates in the default "en_US" format does not require any initialization. e.g.
    /// another formatter: new DateFormat.yMMMMd("en_US")   -> July 10, 1996
    return formatter.format(localDateTime);
  }

  // time is a computed property
  String get time {
    var localDateTime = _event.dateTime.toLocal();
    var formatter = DateFormat('jmz'); //HOUR_MINUTE_TZ
    return formatter.format(localDateTime);
  }

  String get location => _event.location;

  // status is a compound property;
  String get status {
    if (_event.status) {
      return 'Proceeding';
    } else if (!_event.status) {
      return 'Canceled';
    } else {
      return 'NotKnown';
    }
  }
}
