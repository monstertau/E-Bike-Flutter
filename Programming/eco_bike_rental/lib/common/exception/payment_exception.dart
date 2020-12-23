import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///payment exceptions handled here
class PaymentException extends EBRException {
  PaymentException.init(String message) : super.init(message);
}
///invalid card exception
class InvalidCardException extends PaymentException {
  InvalidCardException.init(String message) : super.init(message);
}
///invalid transaction exception
class InvalidTransaction extends PaymentException {
  InvalidTransaction.init(String message) : super.init(message);
}
///card in used exception
class CardInUsedException extends PaymentException {
  CardInUsedException.init(String message) : super.init(message);
}
