import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ListDockScreen extends StatefulWidget {
  @override
  _ListDockScreenState createState() => _ListDockScreenState();
}

class _ListDockScreenState extends State<ListDockScreen> {
  final DockController dockController = new DockController();
  final logger = Logger();
  int _id;

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: AppBar(
        title: Text("List Dock Screen"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: dockController.getAllDocks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData != null) {
                List<DockStation> lstDock = snapshot.data;
                return DataTable(
                  showCheckboxColumn: false,
                  sortAscending: true,
                  sortColumnIndex: 0,
                  columns: [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Address")),
                    DataColumn(label: Text("Area")),
                    DataColumn(label: Text("Available"), numeric: true),
                  ],
                  rows: lstDock
                      .map((e) => DataRow(
                              onSelectChanged: (selected) {
                                if (selected) {
                                  Navigator.pushNamed(
                                      context, detailedDockRoute,
                                      arguments: e.id);
                                }
                              },
                              cells: [
                                DataCell(Text(e.dockName)),
                                DataCell(Text(e.dockAddress)),
                                DataCell(Text(e.dockArea)),
                                DataCell(Text("${e.available}/${e.dockSize}"))
                              ]))
                      .toList(),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}
