import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmRentBikeScreen extends StatefulWidget {
  final Bike bike;

  const ConfirmRentBikeScreen({Key key, this.bike}) : super(key: key);

  @override
  _ConfirmRentBikeScreenState createState() => _ConfirmRentBikeScreenState();
}

class _ConfirmRentBikeScreenState extends State<ConfirmRentBikeScreen> {
  final RentingController rentingController = new RentingController();
  final PaymentController paymentController = new PaymentController();

  @override
  Widget build(BuildContext context) {
    String battery = "None";
    var depositMoney =
        rentingController.calculateDepositMoney(widget.bike.bikeValue);
    DateTime startRent = DateTime.now();
    if (widget.bike is EBike) {
      EBike b = widget.bike;
      battery = "${b.battery}";
    }
    if (widget.bike is TwinEBike) {
      TwinEBike b = widget.bike;
      battery = "${b.battery}";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Rent Bike ${widget.bike.id}"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ItemList("Type", "${widget.bike.category}", Colors.grey[200]),
            ItemList("Barcode", "#${widget.bike.barcode}", Colors.grey[200]),
            ItemList("Color", "${widget.bike.color}", Colors.grey[200]),
            ItemList("Battery Status", "${battery}%", Colors.grey[200]),
            ItemList("Start Rent From",
                "${startRent.toString().substring(0, 19)}", Colors.grey[200]),
            ItemList("Deposit Money", "${depositMoney}", Colors.grey[200]),
            ItemList("Basic Rent Amount", "${widget.bike.baseRentAmount}",
                Colors.grey[200]),
            ItemList("Additional Rent Amount", "${widget.bike.addRentAmount}",
                Colors.grey[200]),
            ItemList("Subtotal", "${depositMoney}", Colors.red[100]),
            RaisedButton(
              onPressed: () {
                Payment payment = paymentController.createPayment(
                    widget.bike,
                    depositMoney,
                    startRent,
                    rentingController.generateRentalCode());
                Navigator.pushNamed(context, choosePaymentRoute,
                    arguments: payment);
                rentingController.lockBike(widget.bike);
              },
              child: Text("Proceed Payment"),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  String _key;
  String _value;
  Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      // margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: this._color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this._key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(this._value)
        ],
      ),
    );
  }

  ItemList(this._key, this._value, this._color);
}
