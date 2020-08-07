import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonHandler {
  saveCreatedEvents(String stringJsonFormat) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/createdEvents.txt');
    await file.writeAsString(stringJsonFormat);
    print('Saved created events to local storage');
  }

  Future<String> readCreatedEvents() async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/createdEvents.txt');
      var text = await file.readAsString();
      return text;
  }

  saveRespondedEvents(String stringJsonFormat) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/respondedEvents.txt');
    await file.writeAsString(stringJsonFormat);
    print('Saved responded events to local storage');
  }

  Future<String> readRespondedEvents() async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/respondedEvents.txt');
      var text = await file.readAsString();
      return text;
  }
}
