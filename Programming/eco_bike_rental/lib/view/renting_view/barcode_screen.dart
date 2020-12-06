import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatefulWidget {
  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  String _barCode;
  Widget _buildBarCode(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Barcode'),
      validator: (String value){
        if(value.isEmpty){
          return 'Barcode is required';
        }
      },
      onSaved: (String value){
        _barCode = value;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Barcode Screen"),
      ),
      // body: Center(
      //
      //   child: RaisedButton(
      //     onPressed: () {
      //       // push navigator to navigate to page
      //       // argument = String barcode
      //       Navigator.pushNamed(context, confirmRentingRoute, arguments: 1);
      //     },
      //     child: Text("Confirm Rent Screen"),
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              _buildBarCode(),
              SizedBox(height: 80),
              RaisedButton(
                child: Text('Confirm renting',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  print(_barCode);
                },
              )
            ],
        ),),
      ),

    );
  }
}
