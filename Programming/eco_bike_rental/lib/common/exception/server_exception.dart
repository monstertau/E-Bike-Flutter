import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///missing header exception
class MissingHeaderException extends EBRException {
  MissingHeaderException.init(String message) : super.init(message);
}
///server exception message handled here
class ServerException extends EBRException {
  ServerException.init(String message) : super.init(message);
}
