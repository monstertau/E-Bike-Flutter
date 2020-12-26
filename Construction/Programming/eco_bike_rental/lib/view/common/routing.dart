import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/bike_view/bike_screen.dart';
import 'package:eco_bike_rental/view/payment_view/choose_payment_screen.dart';
import 'package:eco_bike_rental/view/payment_view/invoice_screen.dart';
import 'package:eco_bike_rental/view/renting_view/choose_return_dock_screen.dart';
import 'package:eco_bike_rental/view/renting_view/confirm_rent_screen.dart';
import 'package:eco_bike_rental/view/bike_view/rented_bike_screen.dart';
import 'package:eco_bike_rental/view/renting_view/confirm_return_screen.dart';
import 'package:flutter/material.dart';
import '../renting_view/barcode_screen.dart';
import '../dock_view/detailed_dock_screen.dart';
import '../dock_view/list_dock_screen.dart';

class AppRouter {
  // implement for navigating between screen
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => ListDockScreen());
        break;
      case detailedDockRoute:
        DockStation dockStation = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, animationTime, child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
            pageBuilder: (context, animation, animationTime) =>
                DetailedDockScreen(dockStation: dockStation));
        break;
      case detailedBikeRoute:
        Bike bike = settings.arguments;
        return MaterialPageRoute(
            builder: (context) =>
                BikeScreen(bike: bike));
        break;
      case barcodeRoute:
        String barcode = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => BarcodeScreen(initBarcode: barcode));
        break;
      case confirmRentingRoute:
        Bike bike = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ConfirmRentBikeScreen(bike: bike));
        break;
      case choosePaymentRoute:
        Payment payment = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, animationTime, child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
            pageBuilder: (context, animation, animationTime) =>
                ChoosePaymentScreen(payment));
        break;
      case rentedBikeRoute:
        return MaterialPageRoute(builder: (context) => RentedBikeScreen());
        break;
      case invoiceRoute:
        Payment payment = settings.arguments;
        return MaterialPageRoute(builder: (context) => InvoiceScreen(payment));
        break;

      case confirmReturnRoute:
        Payment payment = settings.arguments;
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 100),
            transitionsBuilder: (context, animation, animationTime, child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
            pageBuilder: (context, animation, animationTime) => ConfirmReturnScreen(payment));
        break;
      case chooseReturnDockRoute:
        int index = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ChooseReturnDockScreen(index));
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
