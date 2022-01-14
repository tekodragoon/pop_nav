import 'package:flutter/material.dart';
import 'appSecond.dart';

class AppBody extends StatefulWidget {

  @override
  _AppBody createState() => new _AppBody();
}

class _AppBody extends State<AppBody> {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text(
                'Show snackBar',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              onPressed: snack
          ),
          new RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text(
                'Show alert',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              onPressed: alert
          ),
          new RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text(
                'Show message',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              onPressed: (() => dialog('New message', 'Content of message'))
          ),
          new RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text(
                'Show New Page',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
              onPressed: navSecondPage
          )
        ],
      ),
    );
  }

  void snack() {
    SnackBar snackBar = new SnackBar(
        content: new Text(
          "!! here i am !!",
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      duration: new Duration(seconds: 3),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future<Null> alert() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Alert Dialog', textScaleFactor: 1.4),
          content: new Text('Do you wish to continue?'),
          contentPadding: EdgeInsets.all(5.0),
          actions: <Widget>[
            new FlatButton(
                  onPressed: () {
                  print('cancel');
                  Navigator.pop(context);
                },
                child: new Text(
                 'Cancel',
                 style: new TextStyle(
                   color: Colors.red
                 ),
                )
            ),
            new FlatButton(
                onPressed: () {
                  print('valid');
                  Navigator.pop(context);
                },
                child: new Text(
                  'Ok',
                  style: new TextStyle(
                      color: Colors.black
                  ),
                )
            )
          ],
        );
      }
    );
  }

  Future<Null> dialog(String title, String msg) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text(title, textScaleFactor: 1.3),
          contentPadding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Text(msg),
            new RaisedButton(
              child: new Text('OK'),
                onPressed: () {
              Navigator.pop(context);
              print('dialog dismiss');
            }),
          ],
        );
      }
    );
  }

  void navSecondPage() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) {
              return new AppSecond('Second Page');
            }
        )
    );
  }
}