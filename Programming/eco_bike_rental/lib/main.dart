import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/bottom_bar.dart';
import 'package:eco_bike_rental/view/dock_view/list_dock_screen.dart';
import 'package:eco_bike_rental/view/bike_view/rented_bike_screen.dart';
import 'package:eco_bike_rental/view/common/routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///This is the main class to build all the content of the application following [MaterialApp] design.
///Flutter provide [runApp(widget app)] method to build the application.
///Every screens of this application [MyApp] contain three main parts
///* [title]
///* [body]
///* [FABBottomAppBar]
void main() {
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(new MyApp());
}
///The class [MyApp] extends the [StatelessWidget] because the frame of the application remains
///unchange
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco Bike Rental',
      theme: new ThemeData(
          primaryColor: Color(0xFF0B877D), textTheme: GoogleFonts.robotoTextTheme()),
      home: new MyHomePage(title: 'EcoBikeRental App'),
      // routing app
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
///Class [MyHomePage] extends [StatefulWidget]. Each of the [StatefulWidget] contains a state so that
///we can retrieve the information of variable for manipulating in the future.
///
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

///This class provide the state for [MyHomePage]
///[MyHomePage] contains [ListDockScreen] and [RentedBikeScreen]
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _lastSelected = 0;
  List<Widget> _listScreen = [
    ListDockScreen(),
    RentedBikeScreen(),
  ];
///Set state function
  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  ///This method [build] establish the content of the screen. In this situation [MyHomePage]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listScreen[_lastSelected],
      // bottom navigation, don't need to care about this part
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Rent Bike',
        color: Colors.grey,
        selectedColor: Color(0xFF0B877D),
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
            Navigator.pushNamed(context, barcodeRoute);
          });
        },
        child: Icon(Icons.qr_code_scanner),
        elevation: 2.0,
        backgroundColor: Color(0xFF0B877D),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
