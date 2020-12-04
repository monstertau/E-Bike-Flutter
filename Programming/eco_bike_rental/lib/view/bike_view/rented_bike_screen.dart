import 'package:flutter/material.dart';

class RentedBikeScreen extends StatefulWidget {
  @override
  _RentedBikeScreenState createState() => _RentedBikeScreenState();
}

class _RentedBikeScreenState extends State<RentedBikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rented Bike Screen"),
      ),
      body: Container(alignment: Alignment.center, child: Text("test body")),
    );
  }
}
