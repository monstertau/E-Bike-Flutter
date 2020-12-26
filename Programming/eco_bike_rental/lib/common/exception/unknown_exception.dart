import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///Unknown Exception messages is provided here
class UnknownException extends EBRException {
  UnknownException.init(String message) : super.init(message);
}
