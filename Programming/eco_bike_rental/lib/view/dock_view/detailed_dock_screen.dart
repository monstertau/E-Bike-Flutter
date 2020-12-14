import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/utils/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Dock Screen ${widget.id}"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: dockController.getAllBikes(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData != null) {
                List<Bike> lstBike = snapshot.data;
                return
                  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                 child: DataTable(

                  showCheckboxColumn: false,
                  sortAscending: true,
                  sortColumnIndex: 0,
                  columns: [
                    DataColumn(label: Text("Barcode")),
                    DataColumn(label: Text("Id")),
                    DataColumn(label: Text("Type")),
                    DataColumn(label: Text("Color")),
                    DataColumn(label: Text("BaseRentAmount")),
                  ],
                  rows: lstBike
                      .map((e) => DataRow(
                      onSelectChanged: (selected) {
                        if (selected) {
                          Navigator.pushNamed(
                              context, detailedBikeRoute,
                              arguments: e.id);
                        }
                      },
                      cells: [
                        DataCell(Text(e.barcode)),
                        DataCell(Text("${e.id}")),
                        DataCell(Text(e.category)),
                        DataCell(Text(e.color)),
                        DataCell(Text("${e.baseRentAmount}")),
                      ]))
                      .toList(),
                )));
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}