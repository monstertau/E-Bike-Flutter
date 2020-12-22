import 'package:eco_bike_rental/common/exception/bike_exception.dart';
import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatefulWidget {
  final String initBarcode;

  const BarcodeScreen({Key key, this.initBarcode}) : super(key: key);

  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  int _state = 0;
  String errorText = "Barcode is required";
  final RentingController rentingController = new RentingController();
  TextEditingController _textCon;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _textCon = new TextEditingController(text: widget.initBarcode);
  }

  Widget _buildBarCode() {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          labelText: 'Barcode',
          border: OutlineInputBorder(),
          errorText: _validate ? errorText : null),
      controller: _textCon,
    );
  }

  _handlingError(String errorText) {}

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildBarCode(),
            SizedBox(height: 80),
            FlatButton(
              child: setupButtonChild(),
              color: Color(0xFF18C29C),
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                setState(() {
                  _textCon.text.isEmpty ? _validate = true : _validate = false;
                  if (_state == 0 && !_validate) {
                    _state = 1;
                    rentingController
                        .requestRentBike(_textCon.text)
                        .then((value) {
                      Navigator.pushNamed(context, confirmRentingRoute,
                          arguments: value);
                      setState(() {
                        _state = 0;
                      });
                    }).catchError((err) {
                      setState(() {
                        _state = 0;
                        errorText = "Invalid Barcode";
                        _validate = true;
                      });
                    }, test: (e) => e is InvalidBarcodeException).catchError(
                            (err) {
                      setState(() {
                        _state = 0;
                        errorText = "Bike Already In Used";
                        _validate = true;
                      });
                    }, test: (e) => e is BikeInUsedException);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget setupButtonChild() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
      child: _state == 0
          ? Text('RENT BIKE', style: TextStyle(fontSize: 16))
          : CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
    );
  }
}
