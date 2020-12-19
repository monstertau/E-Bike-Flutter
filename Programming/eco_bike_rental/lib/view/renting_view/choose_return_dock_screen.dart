import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:flutter/material.dart';

class ChooseReturnDockScreen extends StatefulWidget {
  @override
  _ChooseReturnDockScreenState createState() => _ChooseReturnDockScreenState();
}

class _ChooseReturnDockScreenState extends State<ChooseReturnDockScreen> {
  final DockController dockController = new DockController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose A Dock For Returning"),
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
                              // Navigator.pushNamed(context, detailedDockRoute,
                              //     arguments: lstDock[index].id);
                              Navigator.pop(context, lstDock[index].dockName);
                            },
                            child: Card(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Expanded(
                                        child: Text(lstDock[index].dockName)),
                                    Expanded(
                                        child:
                                            Text(lstDock[index].dockAddress)),
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
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}
