import 'dart:convert';

import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/API.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'invoice_screen.dart';
import 'dart:developer';

class ChoosePaymentScreen extends StatefulWidget {
  Payment _payment;

  ChoosePaymentScreen(this._payment);

  @override
  _ChoosePaymentScreenState createState() => _ChoosePaymentScreenState();
}

// TextEditingController ownerController = new TextEditingController();
// TextEditingController dateExpiredController = new TextEditingController();
// TextEditingController cardnumberController = new TextEditingController();
// TextEditingController cvvCodeController = new TextEditingController();

TextEditingController ownerController =
    new TextEditingController(text: 'Group 10');
TextEditingController dateExpiredController =
    new TextEditingController(text: '1125');
TextEditingController cardnumberController =
    new TextEditingController(text: '121319_group10_2020');
TextEditingController cvvCodeController =
    new TextEditingController(text: "323");

String dropdownValue = 'One';
PaymentController paymentController = new PaymentController();

class _ChoosePaymentScreenState extends State<ChoosePaymentScreen> {
  bool _validatename = true;
  bool _validatecn = true;
  bool _validatecvv = true;
  bool _validatede = true;

  void _processCard() async {
    final logger = new Logger();
    setState(() {
      _validatename = !paymentController.validateOwner(ownerController.text);
      _validatede =
          paymentController.validateDateExpired(dateExpiredController.text);
      _validatecn =
          paymentController.validateCardCode(cardnumberController.text);
      _validatecvv = paymentController.validateCvvCode(cvvCodeController.text);
    });
    if (_validatecvv && _validatede && _validatename && _validatecn) {
      CreditCard card = new CreditCard(
          cardnumberController.text,
          int.parse(cvvCodeController.text),
          dateExpiredController.text,
          ownerController.text);
      if (!await card.checkInUse()) {
        var result = await paymentController.deductMoney(
            card, widget._payment.depositAmount);
        if (result['success']) {
          Navigator.pushNamed(context, invoiceRoute);
          //TODO: create new payment
          logger.i(widget._payment.bike.barcode);
          // Map invoice = {
          //   "payment": {
          //     "rentalCode": widget._payment.rentalCode,
          //     "depositAmount": widget._payment.depositAmount,
          //     "startRentTime":
          //         widget._payment.startRentTime.toString().split('.')[0],
          //     "endRentTime":
          //         widget._payment.startRentTime.toString().split('.')[0],
          //     "bikeId": widget._payment.bike.id,
          //     "status": 1,
          //     "card": {
          //       "cardCode": card.cardCode,
          //       "cardName": card.owner,
          //       "dateExpired": card.dateExpired,
          //       "cvvCode": card.cvvCode
          //     }
          //   }
          // };
          //save to DB
          // paymentController.save(invoice);
          widget._payment.card = card;
          widget._payment.save();
          //save to share preference
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("rentalCode", widget._payment.rentalCode);

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     // builder: (context) => InvoiceScreen(invoice: result['data']),
          //     builder: (context) => InvoiceScreen(
          //         invoice: invoice['payment'], bike: widget._payment.bike),
          //   ),
          // );
          // Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, invoiceRoute, (Route<dynamic> route) => false,
              arguments: widget._payment);
        } else {
          logger.i(result['message']);
        }
      }

      // InterbankSubsystem interbanl = new Inbank
      // API().Patch("test");
      // print()
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: CustomAppBar(title: "Choose Payment Method", centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TestIcon(iconName: Icons.credit_card),
            SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DropdownCustom(),
                TextField(
                  controller: cardnumberController,
                  // obscureText: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Enter Card Number',
                      errorText: _validatecn ? null : 'Invalid Card Number'),
                ),
                TextField(
                  controller: dateExpiredController,
                  // obscureText: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Date Expired',
                      errorText: _validatede ? null : 'Invalid Date Expired'),
                ),
                TextField(
                  controller: cvvCodeController,
                  // obscureText: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'CVV Code',
                      errorText: _validatecvv ? null : 'Invalid Cvv Code'),
                ),
                TextField(
                  controller: ownerController,
                  // obscureText: false,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Enter Name on the Card',
                      errorText: _validatename ? null : 'Invalid Card Owner'),
                ),
              ],
            )),
            Row(
              // width: 133,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  color: Colors.white,
                  textColor: Colors.blueAccent,
                  padding: EdgeInsets.only(
                      bottom: 12.0, top: 12.0, right: 18.0, left: 18.0),
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.blueAccent)),
                  onPressed: _processCard,
                  child: Text(
                    "Proceed",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DropdownCustom extends StatefulWidget {
  @override
  _DropdownCustomState createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 1.3,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class TestIcon extends StatelessWidget {
  final IconData iconName;

  const TestIcon({Key key, this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new LayoutBuilder(builder: (context, constraint) {
        return new Icon(iconName, size: 300.0);
      }),
    );
  }
}
