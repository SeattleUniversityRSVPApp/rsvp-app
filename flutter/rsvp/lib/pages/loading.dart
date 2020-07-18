import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    await Future.delayed(Duration(seconds: 4));
    await Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'RSVP App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40
              ),
            ),
            SizedBox(height: 110,),
            Text(
              'Loading',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8,),
            SpinKitCubeGrid(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
