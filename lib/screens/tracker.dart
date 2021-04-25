import 'package:flutter/material.dart';
import '../utils/constants.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget{
  @override
  _TrackerState createState() => _TrackerState();

}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          "Covid-19 Tracker",
        ),
        centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Container(
                padding: EdgeInsets.all(32),
              ),
            )
          ],
        ),
    );
  }
}