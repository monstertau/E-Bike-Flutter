import 'package:flutter/material.dart';
import 'text_item.dart';
import 'image_banner.dart';

class BikeScreen extends StatefulWidget {
  final int id;

  const BikeScreen({Key key, this.id}) : super(key: key);

  @override
  _BikeScreenState createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Screen ${widget.id}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("lib/assets/images/bike.jpg", 'Bike 1', true),
          TextItem('Color', 'Blue'),
          TextItem('Distance travelled', '500m'),
          TextItem('Battery Status', '50%'),
          TextItem('Basic Rent Amount', '5USD'),
          TextItem('Additional Rent Amount', '50USD'),
        ],
      ),
    );
  }
}
