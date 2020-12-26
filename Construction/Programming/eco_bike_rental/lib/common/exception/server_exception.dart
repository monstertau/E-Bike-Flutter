import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///Missing header exception messages is provided here
class MissingHeaderException extends EBRException {
  MissingHeaderException.init(String message) : super.init(message);
}
///Server exception messages is provided here
class ServerException extends EBRException {
  ServerException.init(String message) : super.init(message);
}
