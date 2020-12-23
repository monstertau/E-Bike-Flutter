import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';

class ChooseReturnDockScreen extends StatefulWidget {
  final int choosed;

  ChooseReturnDockScreen(this.choosed);

  _ChooseReturnDockScreenState createState() => _ChooseReturnDockScreenState();
}

class _ChooseReturnDockScreenState extends State<ChooseReturnDockScreen> {
  TextEditingController controller = new TextEditingController();
  final DockController dockController = new DockController();
  Map returnMap = {"name": null, "index": null};
  List<DockStation> _searchResult = [];
  List<DockStation> lstDock;
  String searchValue;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   searchValue = "";
  // }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    lstDock.forEach((element) {
      if (element.dockName.contains(text) ||
          element.dockName.toLowerCase().contains(text)) {
        print(element.dockName);
        _searchResult.add(element);
      }
    });

    setState(() {});
  }

  void handleOnTap(lstDock) {
    returnMap['name'] = lstDock.dockName;
    returnMap['index'] = lstDock.dockID;
    Navigator.pop(context, returnMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Choose Dock To Return",
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
              child: Card(
                  child: new ListTile(
                      leading: new Icon(Icons.search),
                      title: new TextField(
                        controller: controller,
                        decoration: new InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                        onChanged: onSearchTextChanged,
                      ),
                      trailing: new IconButton(
                        icon: new Icon(Icons.cancel),
                        onPressed: () {
                          controller.clear();
                          onSearchTextChanged('');
                        },
                      )))),
          Divider(),
          FutureBuilder(
            future: dockController.getAllDocks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData != null) {
                lstDock = snapshot.data;
                return Expanded(
                    // margin: EdgeInsets.only(left: 5),
                    child:
                        _searchResult.length != 0 || controller.text.isNotEmpty
                            ? CustomItemList(_searchResult)
                            : CustomItemList(lstDock));
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      )),
    );
  }

  Widget CustomItemList(lstDock) {
    return ListView.builder(
      itemCount: lstDock.length * 2,
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();
        final i = index ~/ 2;
        return InkWell(
          onTap: () {
            handleOnTap(lstDock[i]);
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
                                margin: EdgeInsets.only(bottom: 2),
                                alignment: Alignment.centerLeft,
                                child: Text(lstDock[i].dockName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700))),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Available Seat:${lstDock[i].available}/${lstDock[i].dockSize}",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)))
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
                      value: lstDock[i].dockID != widget.choosed ? false : true,
                      onChanged: (bool value) {
                        handleOnTap(lstDock[i]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.only(bottom: 13.0),
    );
  }
}
