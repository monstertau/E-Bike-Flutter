import 'package:flutter/material.dart';
import 'text_item.dart';
import 'image_banner.dart';

class RentedBikeScreen extends StatefulWidget {
  @override
  _RentedBikeScreenState createState() => _RentedBikeScreenState();
}

class _RentedBikeScreenState extends State<RentedBikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rented Bike Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("lib/assets/images/bike.jpg", 'Bike 1', true),
          TextItem('Color', 'Blue'),
          TextItem('Distance travelled', '500m'),
          TextItem('Battery Status', '50%'),
          TextItem('Time Rented', '5h'),
          TextItem('Payment Amount', '50USD'),
        ],
      ),
    );
  }
}
