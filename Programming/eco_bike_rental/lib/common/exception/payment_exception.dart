import 'package:eco_bike_rental/common/exception/ebr_exception.dart';

class PaymentException extends EBRException {
  PaymentException.init(String message) : super.init(message);
}

class InvalidCardException extends PaymentException {
  InvalidCardException.init(String message) : super.init(message);
}

class InvalidTransaction extends PaymentException {
  InvalidTransaction.init(String message) : super.init(message);
}

class CardInUsedException extends PaymentException {
  CardInUsedException.init(String message) : super.init(message);
}
