import 'package:logger/logger.dart';

// Routing path
const String homeRoute = "/";
const String detailedDockRoute = "/dock-detail";
const String detailedBikeRoute = "/bike-detail";
const String barcodeRoute = "/rent-bike";
const String confirmRentingRoute = "/confirm-rent";
const String choosePaymentRoute = "/choose-payment";
const String invoiceRoute = "/invoice";
const String rentedBikeRoute = "/rented-detail";
const String returnBikeRoute = "/return-bike";
const String confirmReturnRoute = "/confirm-return";
const String chooseReturnDockRoute = '/choose-return-dock';
// setup logger
final logger = Logger();

// path to get database
const String baseUrl = "https://lunar-bonus-297614.df.r.appspot.com";
const String getAllDockPath = "/dock/get-all";
const String getDockDetailPath = "/dock/get-detail";
const String getBarcodeBikePath = "/bike/search";
const String checkLockedCardPath = "/card/check-locked";
const String savePaymentPath = '/payment/create';
const String updatePaymentPath = '/payment/update';
const String searchPaymentPath = '/payment/search';
