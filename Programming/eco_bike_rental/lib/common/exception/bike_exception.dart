import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

///Bike exception messages is provided here
class BikeException extends EBRException {
  BikeException.init(String message) : super.init(message);
}
///Bike in used exception messages is provided here
class BikeInUsedException extends BikeException {
  BikeInUsedException.init(String message) : super.init(message);
}
///Invalid barcode exception messages is provided here
class InvalidBarcodeException extends BikeException {
  InvalidBarcodeException.init(String message) : super.init(message);
}
/// If try to return to a full bike dockstation this exception will be throw
class ReturnToFullDockException extends BikeException{
  ReturnToFullDockException.init(String message) : super.init(message);
}