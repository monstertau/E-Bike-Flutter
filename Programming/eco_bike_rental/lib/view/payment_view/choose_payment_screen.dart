import 'package:eco_bike_rental/common/exception/payment_exception.dart';
import 'package:eco_bike_rental/controller/BikeController.dart';
import 'package:eco_bike_rental/controller/CreditCardController.dart';
import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChoosePaymentScreen extends StatefulWidget {
  final Payment payment;

  ChoosePaymentScreen(this.payment);

  @override
  _ChoosePaymentScreenState createState() => _ChoosePaymentScreenState();
}

class _ChoosePaymentScreenState extends State<ChoosePaymentScreen> {
  int _state = 0;
  PaymentController _paymentController = new PaymentController();
  CreditCardController _creditCardController = new CreditCardController();
  BikeController _bikeController = new BikeController();
  // TextEditingController ownerController = new TextEditingController();
  // TextEditingController dateExpiredController = new TextEditingController();
  // TextEditingController cardNumberController = new TextEditingController();
  // TextEditingController cvvCodeController = new TextEditingController();

  TextEditingController ownerController =
      new TextEditingController(text: 'Group 10');
  TextEditingController dateExpiredController =
      new TextEditingController(text: '1125');
  TextEditingController cardNumberController =
      new TextEditingController(text: '121319_group10_2020');
  TextEditingController cvvCodeController =
      new TextEditingController(text: "323");

  bool _validatename = true;
  bool _validatecn = true;
  bool _validatecvv = true;
  bool _validatede = true;

  void _processCard() async {
    setState(() {
      _validatename = !_paymentController.validateOwner(ownerController.text);
      _validatede =
          _paymentController.validateDateExpired(dateExpiredController.text);
      _validatecn =
          _paymentController.validateCardCode(cardNumberController.text);
      _validatecvv = _paymentController.validateCvvCode(cvvCodeController.text);
      _state = 1;
    });
    if (_validatecvv && _validatede && _validatename && _validatecn) {
      CreditCard card = new CreditCard(
          cardNumberController.text,
          int.parse(cvvCodeController.text),
          dateExpiredController.text,
          ownerController.text);
      try {
        await _creditCardController.checkInUse(card);
        var result;
        result = await _paymentController.deductMoney(
            card, widget.payment.depositAmount);


        if (result['success']) {
          //save to share preference
          if (await _paymentController.getRentalCodeFromLocal() != null) {
            Fluttertoast.showToast(
                msg: "Please Return Your Bike Before Renting New Bike",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 4,
                backgroundColor: Colors.red);
          } else {
            int cardId = await _creditCardController.searchOrCreateCard(card);
            widget.payment.card = card;
            await _paymentController.savePayment(widget.payment, cardId);
            await _creditCardController.lockCard(cardId);
            await _bikeController.unlockBike(widget.payment.bike.bikeInfo.barcode);
            await _paymentController.saveRentalCodeToLocal(widget.payment.rentalCode);
            setState(() {
              Navigator.pushNamedAndRemoveUntil(
                  context, invoiceRoute, (Route<dynamic> route) => false,
                  arguments: widget.payment);
              _state = 0;
            });

          }
        }
      } on CardInUsedException {
        setState(() {
          _state = 0;
        });
        Fluttertoast.showToast(
            msg: "1 Card Can Rent 1 Bike only",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.red);
      } catch (e) {
        setState(() {
          _state = 0;
        });
        Fluttertoast.showToast(
            msg: "Error: ${e.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.red);
      }
    } else {
      setState(() {
        _state = 0;
      });
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
                  _inputField(cardNumberController, "Card Number",
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
                    color: Color(0xFF126872),
                    textColor: Colors.white,
                    padding: EdgeInsets.only(
                        bottom: 12.0, top: 12.0, right: 18.0, left: 18.0),
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: _processCard,
                    child: setupButtonChild(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setupButtonChild() {
    return Container(
      child: _state == 0
          ? Text('PROCEED', style: TextStyle(fontSize: 16))
          : CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal[400])),
    );
  }
}

class CardItem extends StatelessWidget {
  final IconData iconName;
  final color;
  final cardNumber;

  const CardItem(
      {Key key,
      this.iconName,
      this.color = Colors.black54,
      this.cardNumber = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 15, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          cardNumber != ""
              ? Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    cardNumber,
                    style: TextStyle(color: color, fontSize: 12),
                  ))
              : Text(""),
          Container(
            height: 1.0,
            width: 130.0,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "ATM CARD",
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
