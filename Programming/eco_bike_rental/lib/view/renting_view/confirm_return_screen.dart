import 'dart:async';

import 'package:eco_bike_rental/controller/BikeController.dart';
import 'package:eco_bike_rental/controller/CreditCardController.dart';
import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:eco_bike_rental/view/renting_view/confirm_rent_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmReturnScreen extends StatefulWidget {
  final Payment _payment;
  final logger = Logger();

  ConfirmReturnScreen(this._payment);

  @override
  _ConfirmReturnScreenState createState() => _ConfirmReturnScreenState();
}

String _dockName;
int index = -1;

class _ConfirmReturnScreenState extends State<ConfirmReturnScreen> {
  String _timeString;
  int _initTime;
  int _state = 0;
  PaymentController _paymentController = new PaymentController();

  BikeController _bikeController = new BikeController();

  CreditCardController _creditCardController = new CreditCardController();

  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _initTime = 0;
    Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => {
              if (mounted) {_getTime()}
            });
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
    if (_initTime > 300) {
      Navigator.pop(context, "test");
    }
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setStateIfMounted(() {
      _timeString = formattedDateTime;
      _initTime += 1;
    });
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  void _confirmReturn(context) async {
    setState(() {
      _state = 1;
    });
    if (_dockName != null) {
      Map res;
      try {
        res = await _paymentController.returnDepositMoney(widget._payment.card,
            widget._payment.depositAmount, widget._payment.rentAmount);
      } catch (e) {
        // AlertCustom.show(context, e, AlertType.error).show();
        Fluttertoast.showToast(
            msg: "Error: ${e.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red);
      }
      setState(() {
        _state = 0;
      });
      if (res['success']) {
        Map res = await _paymentController.updatePayment(widget._payment);
        _bikeController.returnBikeToDock(index, res["bikeId"]);
        _bikeController.lockBike(widget._payment.bike.bikeInfo.barcode);
        _creditCardController.unlockCard(res["cardId"]);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove("rentalCode");

        Navigator.pushNamedAndRemoveUntil(
            context, invoiceRoute, (Route<dynamic> route) => false,
            arguments: widget._payment);
      }
    } else {
      // AlertCustom.show(context, "Choose a dock for returning bike", AlertType.warning)
      //     .show();
      setState(() {
        _state = 0;
      });
      Fluttertoast.showToast(
          msg: "Warning: Choose dock before return",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          textColor: Colors.black,
          backgroundColor: Colors.yellow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Return Bike #${widget._payment.bike.bikeInfo.barcode}",
          centerTitle: true),
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            ItemList("Type", widget._payment.bike.category, Colors.grey[200]),
            ItemList(
                "Start Rent From",
                widget._payment.startRentTime
                    .toLocal()
                    .toString()
                    .substring(0, 16),
                Colors.grey[200]),
            ItemList("Time Rented", _timeString, Colors.grey[200]),
            // ItemList("Return to Dock", "Thanh Xuan", Colors.grey[200]),
            ItemChoose(context, "Return to Dock", Colors.grey[200]),
            ItemList("Card Name", widget._payment.card.owner, Colors.grey[200]),
            ItemList(
                "Card Number", widget._payment.card.cardCode, Colors.grey[200]),
            ItemList("Deposit Amount", widget._payment.depositAmount.toString(),
                Colors.grey[200]),
            ItemList("Renting Price", "${widget._payment.rentAmount}",
                Colors.grey[200]),
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ItemList(
                  "Total",
                  "${widget._payment.depositAmount - widget._payment.rentAmount}",
                  Colors.deepOrange[100]),
            ),
            FlatButton(
              onPressed: () {
                _confirmReturn(context);
              },
              child: Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
                  child: _state == 0
                      ? Text("PROCEED RETURN", style: TextStyle(fontSize: 16))
                      : CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Colors.red[400]))),
              textColor: Colors.white,
              color: Colors.red[700],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
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
        FlatButton(
          onPressed: () async {
            var choosedValue = await Navigator.pushNamed(
                context, chooseReturnDockRoute,
                arguments: index);
            if (choosedValue != null) {
              index = (choosedValue as Map)['index'];
              _dockName = (choosedValue as Map)['name'];
            }
          },
          textColor: Colors.white,
          color: Colors.redAccent[100],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          child: Text(_dockName == null ? "Choose dock" : _dockName),
        )
      ],
    ),
  );
}
