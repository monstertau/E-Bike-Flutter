import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

class MissingHeaderException extends EBRException {
  MissingHeaderException.init(String message) : super.init(message);
}

class ServerException extends EBRException {
  ServerException.init(String message) : super.init(message);
}
