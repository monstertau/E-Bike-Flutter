import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:eco_bike_rental/view/common/section_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BikeScreen extends StatefulWidget {
  final Bike bike;

  const BikeScreen({Key key, this.bike}) : super(key: key);

  @override
  _BikeScreenState createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  RentingController _rentingCon = new RentingController();

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  final Color _color = Colors.blue;

  Widget _featureSection(int saddle, int pedal, int rear, bool isStandard) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              _color, Icons.people_alt_outlined, '$saddle Saddle(s)'),
          _buildButtonColumn(
              _color, Icons.accessible_forward, '$pedal Pedal(s)'),
          _buildButtonColumn(_color, Icons.airline_seat_recline_normal_sharp,
              '$rear Rear Seat'),
          isStandard
              ? Container()
              : _buildButtonColumn(
                  _color, Icons.electric_bike, 'Electric Motor'),
        ],
      ),
    );
  }

  Widget _detailSection(String key, String value) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(key), Text(value)],
      ),
    );
  }

  Widget _priceSection(String key, String value) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _isStandard = widget.bike.getBattery() == "None";
    return Scaffold(
      appBar: CustomAppBar(
        title: "Bike Detail",
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              'lib/assets/images/dock.jpg',
              fit: BoxFit.fitWidth,
              height: 200,
            ),
            SectionBanner(title: "BIKE FEATURES"),
            _featureSection(widget.bike.saddle, widget.bike.pedal,
                widget.bike.rear, _isStandard),
            SectionBanner(title: "BIKE DETAILS"),
            _detailSection("Barcode", "#${widget.bike.barcode}"),
            _detailSection("Color", "${widget.bike.color}"),
            _detailSection("Category", "${widget.bike.category}"),
            _detailSection("Battery", "${widget.bike.getBattery()}"),
            _detailSection("Bike Value", "${widget.bike.bikeValue} VND"),
            SectionBanner(title: "PRICE"),
            _priceSection("Deposit Charges",
                "${_rentingCon.calculateDepositMoney(widget.bike.bikeValue)} VND"),
            _priceSection("First 30 minutes Charges",
                "${widget.bike.baseRentAmount} VND"),
            _priceSection(
                "Next 15 minutes Charges", "${widget.bike.addRentAmount} VND"),
            Container(margin: EdgeInsets.only(bottom: 15)),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, barcodeRoute,
                      arguments: widget.bike.barcode);
                },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
                  child: Text(
                    "RENT THIS BIKE",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                textColor: Colors.white,
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)))
          ],
        ),
      ),
    );
  }
}
