import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
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
      appBar: CustomAppBar(title: "Bikes in Dock ${widget.id}"),
      body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: dockController.getAllBikes(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData != null) {
                List<Bike> lstBike = snapshot.data;
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 70,bottom: 10,top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, size: 15),
                          Icon(Icons.favorite, size: 15),
                          Icon(Icons.favorite, size: 15),
                          Icon(Icons.favorite_border, size: 15),
                          Icon(Icons.favorite_border, size: 15),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("Total bikes ${lstBike.length}"))
                        ],
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/dock_new.png',
                      fit: BoxFit.fitWidth,
                      height: 200,
                    ),
                    _buildTableTitle(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: lstBike.length * 2,
                        itemBuilder: (context, index) {
                          if (index.isOdd) return Divider();
                          final i = index ~/ 2;
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, detailedBikeRoute,
                                  arguments: lstBike[i]);
                            },
                            child: ListTile(
                              selectedTileColor: Colors.black,
                              title: Row(
                                children: [
                                  Expanded(child: Text(lstBike[i].barcode)),
                                  Expanded(child: Text(lstBike[i].category)),
                                  Expanded(child: Text(lstBike[i].color)),
                                  Expanded(
                                      child: lstBike[i].lock
                                          ? Text("Available")
                                          : Text("In used"))
                                ],
                              ),
                            ),
                          );
                        },
                        padding: EdgeInsets.only(bottom: 13.0),
                      ),
                    )
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}
