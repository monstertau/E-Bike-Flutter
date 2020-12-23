import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

///exception for Bike
class BikeException extends EBRException {
  BikeException.init(String message) : super.init(message);
}
///bike in used Exception
class BikeInUsedException extends BikeException {
  BikeInUsedException.init(String message) : super.init(message);
}
///invalid Barcode Exception
class InvalidBarcodeException extends BikeException {
  InvalidBarcodeException.init(String message) : super.init(message);
}
