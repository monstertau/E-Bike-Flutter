import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

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
    DateTime startRent = DateTime.now().toUtc();
    if (widget.bike is EBike) {
      EBike b = widget.bike;
      battery = "${b.battery}";
    }
    if (widget.bike is TwinEBike) {
      TwinEBike b = widget.bike;
      battery = "${b.battery}";
    }
    return Scaffold(
      appBar: CustomAppBar(title: "Rent Bike", centerTitle: true),
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            ItemList("Type", "${widget.bike.category}", Colors.grey[200]),
            ItemList("Barcode", "#${widget.bike.barcode}", Colors.grey[200]),
            ItemList("Color", "${widget.bike.color}", Colors.grey[200]),
            ItemList("Battery Status", "${battery}%", Colors.grey[200]),
            ItemList("Start Rent From",
                "${startRent.toLocal().toString().substring(0, 16)}", Colors.grey[200]),
            ItemList("Deposit Money", "${depositMoney} VND", Colors.grey[200]),
            ItemList("Basic Rent Amount", "${widget.bike.baseRentAmount} VND",
                Colors.grey[200]),
            ItemList("Additional Rent Amount",
                "${widget.bike.addRentAmount} VND", Colors.grey[200]),
            Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: ItemList("Subtotal", "- ${depositMoney} VND",
                    Colors.deepOrange[100])),
            FlatButton(
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
                child: Container(
                    padding: EdgeInsets.only(top: 15,bottom: 15,left: 5,right: 5),
                    child: Text(
                      "Proceed Payment",
                      style: TextStyle(fontSize: 16),
                    )),
                textColor: Colors.white,
                color: Colors.green[600],
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final String _key;
  final String _value;
  final Color _color;

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
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
          ),
          Text(this._value,style: TextStyle(fontSize: 14),)
        ],
      ),
    );
  }

  ItemList(this._key, this._value, this._color);
}
