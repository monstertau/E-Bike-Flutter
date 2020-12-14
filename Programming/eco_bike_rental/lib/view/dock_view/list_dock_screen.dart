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
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Name",
                            style: TextStyle(
                                height: 3.0,
                                fontSize: 15.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Address",
                            style: TextStyle(
                                height: 3.0,
                                fontSize: 15.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Area",
                            style: TextStyle(
                                height: 3.0,
                                fontSize: 15.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "Available",
                          style: TextStyle(
                              height: 3.0,
                              fontSize: 15.2,
                              fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: lstDock.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, detailedDockRoute,
                                  arguments: lstDock[index].id);
                            },
                            child: Card(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Expanded(
                                        child: Text(lstDock[index].dockName)),
                                    Expanded(
                                        child: Text(lstDock[index].dockAddress)),
                                    Expanded(
                                        child: Text(lstDock[index].dockArea)),
                                    Expanded(
                                        child: Text(
                                            "${lstDock[index].available}/${lstDock[index].dockSize}"))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        padding: EdgeInsets.only(bottom: 13.0),
                      ),
                    )
                  ],
                );
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
