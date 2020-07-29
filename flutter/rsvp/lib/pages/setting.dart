
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Setting extends StatelessWidget {
  bool changeStatus = true;
  List<String> events = [
    'Visibility',
    'In-App sound',
    'Location Service',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
    appBar: AppBar(
    title: Text('Setting'),
    centerTitle: true,
    backgroundColor: Colors.grey[800],
    ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: SwitchListTile(
                value: changeStatus,
                title: Text( events[index]),
                onChanged: (value) {},
              ),
            ),
          );
        },
      ),
    );

  }
}
