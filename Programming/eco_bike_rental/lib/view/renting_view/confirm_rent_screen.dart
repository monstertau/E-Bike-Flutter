import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';

class ConfirmRentBikeScreen extends StatefulWidget {
  final int id;

  const ConfirmRentBikeScreen({Key key, this.id}) : super(key: key);

  @override
  _ConfirmRentBikeScreenState createState() => _ConfirmRentBikeScreenState();
}

class _ConfirmRentBikeScreenState extends State<ConfirmRentBikeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Rent ${widget.id}"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // push navigator to navigate to page
            // argument = id of bike
            Navigator.pushNamed(context, choosePaymentRoute);
          },
          child: Text("Choose Payment screen"),
        ),
      ),
    );
  }
}
