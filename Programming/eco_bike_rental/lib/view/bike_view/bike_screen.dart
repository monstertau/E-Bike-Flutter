import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/utils/Utils.dart';
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

  final Color _color = Color(0xFF18C29C);

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
    bool _isStandard = widget.bike.showBattery() == "None";
    return Scaffold(
      appBar: CustomAppBar(
        title: "Bike Detail",
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Hero(
              tag: "${widget.bike.id}",
              child: Image.asset(
                widget.bike.imagePath,
                fit: BoxFit.fitWidth,
                height: 200,
                width: 400,
              ),
            ),
            SectionBanner(title: "BIKE FEATURES"),
            _featureSection(widget.bike.bikeInfo.saddle, widget.bike.bikeInfo.pedal,
                widget.bike.bikeInfo.rear, _isStandard),
            SectionBanner(title: "BIKE DETAILS"),
            _detailSection("Barcode", "#${widget.bike.bikeInfo.barcode}"),
            _detailSection("Color", "${widget.bike.bikeInfo.color}"),
            _detailSection("Category", "${widget.bike.category}"),
            _detailSection("Battery", "${widget.bike.showBattery()}"),
            _detailSection("Bike Value", "${Utils.numberFormat(widget.bike.bikeInfo.bikeValue)} VND"),
            SectionBanner(title: "PRICE"),
            _priceSection("Deposit Charges",
                "${Utils.numberFormat(_rentingCon.calculateDepositMoney(widget.bike.bikeInfo.bikeValue))} VND"),
            _priceSection("First 30 minutes Charges",
                "${Utils.numberFormat(widget.bike.bikeInfo.baseRentAmount)} VND"),
            _priceSection(
                "Next 15 minutes Charges", "${Utils.numberFormat(widget.bike.bikeInfo.addRentAmount)} VND"),
            Container(margin: EdgeInsets.only(bottom: 15)),
            widget.bike.bikeInfo.lock
                ? FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, barcodeRoute,
                          arguments: widget.bike.bikeInfo.barcode);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 5, right: 5),
                      child: Text(
                        "RENT THIS BIKE",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    textColor: Colors.white,
                    color: Color(0xFF18C29C),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)))
                : Container()
          ],
        ),
      ),
    );
  }
}
