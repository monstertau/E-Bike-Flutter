import 'package:eco_bike_rental/view/renting_view/barcode_screen.dart';
import 'package:eco_bike_rental/view/common/bottom_bar.dart';
import 'package:eco_bike_rental/view/dock_view/list_dock_screen.dart';
import 'package:eco_bike_rental/view/bike_view/rented_bike_screen.dart';
import 'package:eco_bike_rental/view/common/routing.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'EcoBikeRental App'),
      // routing app
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _lastSelected = 0;
  List<Widget> _listScreen = [
    ListDockScreen(),
    RentedBikeScreen(),
    BarcodeScreen(),
  ];

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listScreen[_lastSelected],
      // bottom navigation, don't need to care about this part
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Rent Bike',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.view_list, text: 'List Dock'),
          FABBottomAppBarItem(
              iconData: Icons.directions_bike, text: 'View Rented Bike'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _lastSelected = 2;
          });
        },
        child: Icon(Icons.qr_code_scanner),
        elevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
