import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

class UnknownException extends EBRException {
  UnknownException.init(String message) : super.init(message);
}
