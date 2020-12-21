import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BikeScreen extends StatefulWidget {
  final int id;

  const BikeScreen({Key key, this.id}) : super(key: key);

  @override
  _BikeScreenState createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
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
              // color: color,
            ),
          ),
        ),
      ],
    );
  }

  final Color _color = Colors.black;

  Widget _featureSection() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(_color, Icons.people_alt_outlined, '2 Saddle'),
          _buildButtonColumn(_color, Icons.accessible_forward, '1 Pedal'),
          _buildButtonColumn(
              _color, Icons.airline_seat_recline_normal_sharp, '1 Rear Seat'),
          _buildButtonColumn(_color, Icons.electric_bike, 'Electric Motor'),
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
    // TODO: complete design screen
    return Scaffold(
      appBar: CustomAppBar(
        title: "Bike Screen ${widget.id}",
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
            Divider(),
            Text("Bike Features"),
            _featureSection(),
            Divider(),
            Text("Bike Details"),
            _detailSection("Barcode", "#abcde"),
            _detailSection("Color", "Blue"),
            _detailSection("Category", "E-Bike"),
            _detailSection("Color", "Blue"),
            _detailSection("Bike Value", "200000 VND"),
            Divider(),
            Text("Price"),
            _priceSection("Deposit Charges", "80000 VND"),
            _priceSection("First 30 minutes Charges", "15000 VND"),
            _priceSection("Next 15 minutes Charges", "3000 VND"),
            Container(margin: EdgeInsets.only(bottom: 15)),
            FlatButton(
                onPressed: () {},
                child: Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
                  child: Text(
                    "Rent This Bike",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                textColor: Colors.white,
                color: Colors.orange[400],
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)))
          ],
        ),
      ),
    );
  }
}
