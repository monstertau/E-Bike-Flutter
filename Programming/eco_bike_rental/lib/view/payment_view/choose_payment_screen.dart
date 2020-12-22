import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
          widget._payment.card = card;
          widget._payment.save();
          //save to share preference
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("rentalCode", widget._payment.rentalCode);
          Navigator.pushNamedAndRemoveUntil(
              context, invoiceRoute, (Route<dynamic> route) => false,
              arguments: widget._payment);
        } else {
          logger.i(result['message']);
        }
      }
    }
  }

  Widget _inputField(TextEditingController con, String labelText,
      String errorText, bool validation) {
    return Container(
      padding: EdgeInsets.only(bottom: 15, top: 10),
      child: TextField(
        controller: con,
        // obscureText: false,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            errorText: validation ? null : errorText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: CustomAppBar(title: "Choose Payment Method", centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CardItem(),
              Container(margin: EdgeInsets.only(top: 50)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _inputField(cardnumberController, "Card Number",
                      "Invalid Card Number", _validatecn),
                  _inputField(dateExpiredController, "Date Expired",
                      "Invalid Date Expired", _validatede),
                  _inputField(cvvCodeController, "CVV Code", "Invalid Cvv Code",
                      _validatecvv),
                  _inputField(ownerController, "Card Name",
                      "Invalid Card Owner", _validatename),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.teal[600],
                    textColor: Colors.white,
                    padding: EdgeInsets.only(
                        bottom: 12.0, top: 12.0, right: 18.0, left: 18.0),
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: _processCard,
                    child: Text(
                      "PROCEED",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final IconData iconName;

  const CardItem({Key key, this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black54,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 1.0,
            width: 130.0,
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text("ATM CARD"),
          ),
        ],
      ),
    );
  }
}
