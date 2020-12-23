import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///unknown Exception
class UnknownException extends EBRException {
  UnknownException.init(String message) : super.init(message);
}
