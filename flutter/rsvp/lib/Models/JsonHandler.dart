import 'dart:convert'; //Encoders and decoders for converting between different data representations, including JSON and UTF-8.
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonHandler {
  void saveCreatedEvents(String stringJsonFormat) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/createdEvents.txt');
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(stringJsonFormat);
    print('Saved created events to local storage');
  }

  Future<String> readCreatedEvents() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/createdEvents.txt');
    var text = await file.readAsString();
    if (!await file.exists()) {
      await file.create();
    }
    return text;
  }

  void saveRespondedEvents(String stringJsonFormat) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/respondedEvents.txt');
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(stringJsonFormat);
    print('Saved responded events to local storage');
  }

  Future<String> readRespondedEvents() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/respondedEvents.txt');
    if (!await file.exists()) {
      await file.create();
    }
    var text = await file.readAsString();
    return text;
  }

  Future saveUserName(String userName) async {
    var usrNmJsonObj = {"userName" : "$userName"};
    var jsonString = json.encode(usrNmJsonObj);
    var directory = await getApplicationDocumentsDirectory();
    var fileName = 'userName.json';
    var file = File(directory.path + '/' + fileName);
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(jsonString);
  }

  Future<String> readUserName() async {
    var directory = await getApplicationDocumentsDirectory();
    var fileName = 'userName.json';
    var file = File(directory.path + '/' + fileName);
    if (!await file.exists()) {
      throw Exception('user name file not exists');
    }
    var jsonString = await file.readAsString();
    var usrNmJsonObj = json.decode(jsonString);
    var userName = usrNmJsonObj['userName'] as String;
    return userName;
  }
}
