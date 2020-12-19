import 'package:eco_bike_rental/model/Bike/Bike.dart';
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
        int id = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => DetailedDockScreen(id: id));
        break;
      case detailedBikeRoute:
        int id = settings.arguments;
        return MaterialPageRoute(builder: (context) => BikeScreen(id: id));
        break;
      case barcodeRoute:
        return MaterialPageRoute(builder: (context) => BarcodeScreen());
        break;
      case confirmRentingRoute:
        Bike bike = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ConfirmRentBikeScreen(
                  bike: bike,
                ));
        break;
      case choosePaymentRoute:
        Payment payment = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ChoosePaymentScreen(payment));
        break;
      case rentedBikeRoute:
        String id = settings.arguments;
        return MaterialPageRoute(builder: (context) => RentedBikeScreen());
        break;

      case invoiceRoute:
        Payment payment = settings.arguments;
        return MaterialPageRoute(builder: (context) => InvoiceScreen(payment));
        break;

      case confirmReturnRoute:
        Payment payment = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ConfirmReturnScreen(payment));
        break;
      case chooseReturnDockRoute:
        return MaterialPageRoute(
            builder: (context) => ChooseReturnDockScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
