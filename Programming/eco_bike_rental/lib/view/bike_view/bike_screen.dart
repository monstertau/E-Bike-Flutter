import 'package:eco_bike_rental/controller/BikeController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:flutter/material.dart';

import 'image_banner.dart';
import 'text_item.dart';

class BikeScreen extends StatefulWidget {
  final Bike bike;
  const BikeScreen({Key key, this.bike}) : super(key: key);

  @override
  _BikeScreenState createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  final BikeController bikeController = new BikeController();

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
        appBar: AppBar(
          title: Text("Bike Screen ${widget.bike.id}"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner("lib/assets/images/bike.jpg", 'Bike 1', true),
              TextItem('Type', widget.bike.category),
              TextItem('Color', widget.bike.color),
              //TextItem('Distance travelled', '500m'),
              //TextItem('Battery Status', widget.bike.color),
              TextItem('Basic Rent Amount', "${widget.bike.baseRentAmount}"),
              TextItem(
                  'Additional Rent Amount', "${widget.bike.addRentAmount}"),
            ],
          ),
        ));
  }
}
