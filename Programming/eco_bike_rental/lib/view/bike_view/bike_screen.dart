import 'package:flutter/material.dart';

class BikeScreen extends StatefulWidget {
  final int id;

  const BikeScreen({Key key, this.id}) : super(key: key);

  @override
  _BikeScreenState createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Screen ${widget.id}"),
      ),
      body: Container(),
    );
  }
}
