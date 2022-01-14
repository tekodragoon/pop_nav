import 'package:flutter/material.dart';

class AppSecond extends StatelessWidget {

  AppSecond(String title) {
    this.title = title;
  }

  String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text(
          'Welcome to next page',
          textScaleFactor: 2.0,
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo
          ),
        ),
      ),
    );
  }

}