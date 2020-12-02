import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';

class ListDockScreen extends StatefulWidget {
  @override
  _ListDockScreenState createState() => _ListDockScreenState();
}

class _ListDockScreenState extends State<ListDockScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
        appBar: AppBar(
          title: Text("List Dock Screen"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              // push navigator to navigate to page
              // argument = id of dock
              Navigator.pushNamed(context, detailedDockRoute, arguments: 1);
            },
            child: Text("Detail dock screen"),
          ),
        ));
  }
}
