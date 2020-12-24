import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

///Bike exception message is provided here
class BikeException extends EBRException {
  BikeException.init(String message) : super.init(message);
}
///Bike in used Exception is provided here
class BikeInUsedException extends BikeException {
  BikeInUsedException.init(String message) : super.init(message);
}
///Invalid barcode exception is provided here
class InvalidBarcodeException extends BikeException {
  InvalidBarcodeException.init(String message) : super.init(message);
}
