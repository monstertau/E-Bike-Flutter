import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///Missing header exception
class MissingHeaderException extends EBRException {
  MissingHeaderException.init(String message) : super.init(message);
}
///Server exception message handled here
class ServerException extends EBRException {
  ServerException.init(String message) : super.init(message);
}
