import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:logger/logger.dart';

class ListDockScreen extends StatefulWidget {
  @override
  _ListDockScreenState createState() => _ListDockScreenState();
}

class _ListDockScreenState extends State<ListDockScreen> {
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
          Expanded(child: _itemTitle("Name")),
          _verticalDivider(),
          Expanded(child: _itemTitle("Address")),
          _verticalDivider(),
          Expanded(child: _itemTitle("Area")),
          _verticalDivider(),
          Expanded(child: _itemTitle("Available")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: complete design screen
    return Scaffold(
      appBar: CustomAppBar(title: "List Dock Stations", oneScreen: true),
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
                    Image.asset(
                      "lib/assets/images/dock_new.jpg",
                      fit: BoxFit.fitWidth,
                      height: 200,
                    ),
                    _buildTableTitle(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: lstDock.length * 2,
                        itemBuilder: (context, index) {
                          if (index.isOdd) return Divider();
                          final i = index ~/ 2;
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, detailedDockRoute,
                                  arguments: lstDock[i].id);
                            },
                            child: ListTile(
                              selectedTileColor: Colors.black,
                              title: Row(
                                children: [
                                  Expanded(child: Text(lstDock[i].dockName)),
                                  Expanded(child: Text(lstDock[i].dockAddress)),
                                  Expanded(child: Text(lstDock[i].dockArea)),
                                  Expanded(
                                      child: Text(
                                          "${lstDock[i].available}/${lstDock[i].dockSize}"))
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
