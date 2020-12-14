import 'package:flutter/material.dart';

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

  Widget TextItem(String key, String value) {
    return Container(
      color: Colors.grey[400],
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(key), Text(value)],
      ),
    );
  }
}
