import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';

class ChooseReturnDockScreen extends StatefulWidget {
  @override
  final int _choosed;

  ChooseReturnDockScreen(this._choosed);

  _ChooseReturnDockScreenState createState() => _ChooseReturnDockScreenState();
}

class _ChooseReturnDockScreenState extends State<ChooseReturnDockScreen> {
  final DockController dockController = new DockController();
  Map returnMap = {"name": null, "index": null};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Choose Dock To Return",
        centerTitle: true,
      ),
      body: Container(
          child: FutureBuilder(
        future: dockController.getAllDocks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData != null) {
            List<DockStation> lstDock = snapshot.data;
            return Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  Text("Search Bar"),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lstDock.length * 2,
                      itemBuilder: (context, index) {
                        if (index.isOdd) return Divider();
                        final i = index ~/ 2;
                        return InkWell(
                          onTap: () {
                            returnMap['name'] = lstDock[i].dockName;
                            returnMap['index'] = lstDock[i].dockID;
                            Navigator.pop(context, returnMap);
                          },
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(Icons.local_parking)),
                                      Expanded(
                                        // alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 2),
                                                alignment: Alignment.centerLeft,
                                                child: Text(lstDock[i].dockName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700))),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    "Available Seat:${lstDock[i].available}/${lstDock[i].dockSize}",
                                                    style: TextStyle(
                                                        fontSize: 12,color: Colors.grey)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Radio(
                                        groupValue: true,
                                        value:
                                            lstDock[i].dockID != widget._choosed
                                                ? false
                                                : true),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      padding: EdgeInsets.only(bottom: 13.0),
                    ),
                  )
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
