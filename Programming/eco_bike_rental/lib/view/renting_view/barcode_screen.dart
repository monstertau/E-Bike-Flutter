import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatefulWidget {
  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Barcode Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // push navigator to navigate to page
            // argument = String barcode
            Navigator.pushNamed(context, confirmRentingRoute, arguments: 1);
          },
          child: Text("Confirm Rent Screen"),
        ),
      ),
    );
  }
}
