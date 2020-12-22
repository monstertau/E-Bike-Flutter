import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:eco_bike_rental/view/common/section_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DetailedDockScreen extends StatefulWidget {
  final int id;

  const DetailedDockScreen({Key key, this.id}) : super(key: key);

  @override
  _DetailedDockScreenState createState() => _DetailedDockScreenState();
}

class _DetailedDockScreenState extends State<DetailedDockScreen> {
  final DockController dockController = new DockController();
  final logger = Logger();

  Widget _itemTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style:
            TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 30.0,
      width: 1.0,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }

  Widget _buildTableTitle() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _itemTitle("BikeId")),
          _verticalDivider(),
          Expanded(child: _itemTitle("Type")),
          _verticalDivider(),
          Expanded(child: _itemTitle("Color")),
          _verticalDivider(),
          Expanded(child: _itemTitle("Status")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: dockController.getAllBikes(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData != null) {
                List<Bike> lstBike = snapshot.data;
                return Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SectionBanner(title: "TOTAL BIKES: 8"),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: GridView.count(
                          physics: BouncingScrollPhysics(),
                          childAspectRatio: 1 / 1.55,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: lstBike.map((e) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, detailedBikeRoute,
                                      arguments: e);
                                },
                                child: buildBike(e, null));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}

Widget buildBike(Bike bike, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text("${bike.barcode}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 120,
          child: Center(
            child: Hero(
                tag: "${bike.id}",
                child: Image.asset("lib/assets/images/dock.jpg",
                    fit: BoxFit.fitWidth)),
          ),
        ),
        SizedBox(height: 8),
        Text(bike.lock ? "Status: Available" : "Status: In Used",
            style: TextStyle(fontSize: 14)),
        SizedBox(height: 8),
        Text(
          "${bike.category}",
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1),
        ),
        Text(
          "Battery: ${bike.getBattery()}",
          style: TextStyle(fontSize: 14, color: Colors.green),
        ),
      ],
    ),
  );
}
