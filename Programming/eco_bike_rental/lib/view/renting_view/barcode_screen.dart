import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatefulWidget {
  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  String _barCode;
  int _state = 0;
  final RentingController rentingController = new RentingController();

  Widget _buildBarCode() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration:
          InputDecoration(labelText: 'Barcode', border: OutlineInputBorder()),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Barcode is required';
        }
      },
      onSaved: (String value) {
        _barCode = value;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: CustomAppBar(
        title: "Enter Barcode",
        centerTitle: true,
        oneScreen: false,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildBarCode(),
              SizedBox(height: 80),
              FlatButton(
                child: setupButtonChild(),
                color: Colors.blue,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  setState(() {
                    if (_state == 0) {
                      _state = 1;
                      rentingController.requestRentBike(_barCode).then((value) {
                        Navigator.pushNamed(context, confirmRentingRoute,
                            arguments: value);
                        setState(() {
                          _state = 0;
                        });
                      });
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setupButtonChild() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
      child: _state == 0
          ? Text('Confirm renting', style: TextStyle(fontSize: 16))
          : CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
    );
  }
}
