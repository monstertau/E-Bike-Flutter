import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:eco_bike_rental/view/common/section_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DetailedDockScreen extends StatefulWidget {
  final DockStation dockStation;

  const DetailedDockScreen({Key key, this.dockStation}) : super(key: key);

  @override
  _DetailedDockScreenState createState() => _DetailedDockScreenState();
}

class _DetailedDockScreenState extends State<DetailedDockScreen> {
  final DockController dockController = new DockController();
  final logger = Logger();

  static const filterState = ["All", "Available", "In Used"];
  int selectedFilter = 0;

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
            future: dockController.getAllBikes(widget.dockStation),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData != null) {
                List<Bike> lstBike = snapshot.data;
                List<Bike> availableBike = [];
                List<Bike> unavailableBike = [];
                lstBike.forEach((element) {
                  if (!element.bikeInfo.lock)
                    unavailableBike.add(element);
                  else
                    availableBike.add(element);
                });
                return selectedFilter == 0
                    ? lstBikeWidget(lstBike)
                    : (selectedFilter == 1
                        ? lstBikeWidget(availableBike)
                        : lstBikeWidget(unavailableBike));
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            buildFilterIcon(),
            Row(
              children: buildFilters(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filterState.length; i++) {
      list.add(buildFilter(i));
    }
    return list;
  }

  Widget buildFilter(i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = i;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          filterState[i],
          style: TextStyle(
              color: selectedFilter == i ? Color(0xFF18C29F) : Colors.grey[300],
              fontSize: 17,
              fontWeight:
                  selectedFilter == i ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

  Widget buildFilterIcon() {
    return Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Color(0xFF18C29F),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.filter_list,
            size: 24.0,
            color: Colors.white,
          ),
        ));
  }

  Widget lstBikeWidget(lstBike) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          SectionBanner(title: "TOTAL BIKES: ${lstBike.length}"),
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
              children: lstBike.map<Widget>((e) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, detailedBikeRoute,
                          arguments: e);
                    },
                    child: buildBike(e, null));
              }).toList(),
            ),
          ),
        ],
      ),
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
              color: Color(0xFF18C29C),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text("${bike.bikeInfo.barcode}",
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
                child: Image.asset(bike.imagePath, fit: BoxFit.fitWidth)),
          ),
        ),
        SizedBox(height: 8),
        Text(bike.bikeInfo.lock ? "Status: Available" : "Status: In Used",
            style: TextStyle(fontSize: 14)),
        SizedBox(height: 8),
        Text(
          "${bike.category}",
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1),
        ),
        Text(
          "Battery: ${bike.showBattery()}",
          style: TextStyle(fontSize: 14, color: Color(0xFF18C29C)),
        ),
      ],
    ),
  );
}
