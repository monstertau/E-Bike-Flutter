import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

class BikeException extends EBRException {
  BikeException.init(String message) : super.init(message);
}

class BikeInUsedException extends BikeException {
  BikeInUsedException.init(String message) : super.init(message);
}

class InvalidBarcodeException extends BikeException {
  InvalidBarcodeException.init(String message) : super.init(message);
}
