import 'dart:async';

import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/renting_view/choose_return_dock_screen.dart';
import 'package:eco_bike_rental/view/renting_view/confirm_rent_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmReturnScreen extends StatefulWidget {
  Payment _payment;

  ConfirmReturnScreen(this._payment);

  @override
  _ConfirmReturnScreenState createState() => _ConfirmReturnScreenState();
}

class _ConfirmReturnScreenState extends State<ConfirmReturnScreen> {
  String _timeString;

  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  String _formatDateTime(DateTime dateTime) {
    return dateTime
        .difference(widget._payment.startRentTime)
        .inHours
        .toString() +
        "h" +
        dateTime
            .difference(widget._payment.startRentTime)
            .inMinutes
            .remainder(60)
            .toString() +
        "m";
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  void _confirmReturn() async {
    // Navigator.pushNamed(context, invoiceRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Return Bike ${widget._payment.bike.id}"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ItemList("Type", widget._payment.bike.category, Colors.grey[200]),
            ItemList("Start Rent From",
                widget._payment.startRentTime.toString(), Colors.grey[200]),
            ItemList("Time Rented", _timeString, Colors.grey[200]),
            // ItemList("Return to Dock", "Thanh Xuan", Colors.grey[200]),
            ItemChoose(context, "Return to Dock", Colors.grey[200]),
            ItemList("Card Name", widget._payment.card.owner, Colors.grey[200]),
            ItemList(
                "Card Number", widget._payment.card.cardCode, Colors.grey[200]),
            ItemList("Deposit Amount", widget._payment.depositAmount.toString(),
                Colors.grey[200]),
            ItemList("Renting Price", "-", Colors.grey[200]),
            ItemList("Total", "+", Colors.red[200]),
            RaisedButton(
              onPressed: () {
                _confirmReturn();
              },
              child: Text("Return Bike"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ItemChoose(context, title, color) {
  return Container(
    padding: EdgeInsets.all(15),
    // margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
    color: color,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    OutlineButton(
      onPressed: () {
        Navigator.pushNamed(context, chooseReturnDockRoute);
      },
      shape: new RoundedRectangleBorder(),
      child: Text(
      "Choose Dock",
      style: TextStyle(
        color: Colors.grey,

      ),
    ),
  )],
  )
  ,
  );
}
