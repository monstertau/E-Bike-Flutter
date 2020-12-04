import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:flutter/material.dart';

class ChoosePaymentScreen extends StatefulWidget {
  @override
  _ChoosePaymentScreenState createState() => _ChoosePaymentScreenState();
}

TextEditingController ownerController = new TextEditingController();
TextEditingController dateExpiredController = new TextEditingController();
TextEditingController cardnumberController = new TextEditingController();
TextEditingController cvvCodeController = new TextEditingController();
String dropdownValue = 'One';
PaymentController paymentController = new PaymentController();

class _ChoosePaymentScreenState extends State<ChoosePaymentScreen> {
  bool _validatename = true;
  bool _validatecn = true;
  bool _validatecvv = true;
  bool _validatede = true;
  void _processCard() {
    setState(() {
      _validatename = !paymentController.validateOwner(ownerController.text);
      _validatede =
          paymentController.validateDateExpired(dateExpiredController.text);
      _validatecn =
          paymentController.validateCardCode(cardnumberController.text);
      _validatecvv = paymentController.valideCvvCode(cvvCodeController.text);
    });
    if (_validatecvv && _validatede && _validatename && _validatecn) {
      CreditCard card = new CreditCard(
          cardnumberController.text,
          int.parse(cvvCodeController.text),
          dateExpiredController.text,
          ownerController.text);
      paymentController.checkAccountInfo(card);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Payment Screen"),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TestIcon(iconName: Icons.credit_card),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
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
            ),
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
