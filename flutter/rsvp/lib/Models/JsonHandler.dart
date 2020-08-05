import 'package:flutter/services.dart';

class JsonHandler {
  Future<String> _loadCreatedEvents() async {
    return await rootBundle.loadString('lib/Models/test.txt');
  }

  Future<String> loadCreatedEvents() async {
    var jsonString = await _loadCreatedEvents();
    //final jsonResponse = json.decode(jsonString);
    print(jsonString);
    return jsonString ;
  }
}
