import 'dart:js';

import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/bike_view/bike_screen.dart';
import 'package:eco_bike_rental/view/payment_view/choose_payment_screen.dart';
import 'package:eco_bike_rental/view/payment_view/invoice_screen.dart';
import 'package:eco_bike_rental/view/renting_view/confirm_rent_screen.dart';
import 'package:eco_bike_rental/view/bike_view/rented_bike_screen.dart';
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
        int id = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ConfirmRentBikeScreen(id: id));
        break;
      case choosePaymentRoute:
        return MaterialPageRoute(builder: (context) => ChoosePaymentScreen());
      case rentedBikeRoute:
        String id = settings.arguments;
        return MaterialPageRoute(builder: (context) => RentedBikeScreen());
      case invoiceRoute:
        return MaterialPageRoute(builder: (context) => InvoiceScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
