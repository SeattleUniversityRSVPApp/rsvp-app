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
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/createdEvents.txt');
      String text = await file.readAsString();
      return text;
    } catch (e) {
      print("Created file: Couldn't read file");
    }
  }

  saveRespondedEvents(String stringJsonFormat) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/respondedEvents.txt');
    await file.writeAsString(stringJsonFormat);
    print('Saved responded events to local storage');
  }

  Future<String> readRespondedEvents() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/respondedEvents.txt');
      String text = await file.readAsString();
      return text;
    } catch (e) {
      print("Responded file: Couldn't read file");
    }
  }

}
