import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailedDockScreen extends StatefulWidget {
  final int id;

  const DetailedDockScreen({Key key, this.id}) : super(key: key);


  @override
  _DetailedDockScreenState createState() => _DetailedDockScreenState();
}

class _DetailedDockScreenState extends State<DetailedDockScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Dock Screen ${widget.id}"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // push navigator to navigate to page
            // argument = id of bike
            Navigator.pushNamed(context, detailedBikeRoute, arguments: 2);
          },
          child: Text("Bike screen"),
        ),
      ),
    );
  }
}