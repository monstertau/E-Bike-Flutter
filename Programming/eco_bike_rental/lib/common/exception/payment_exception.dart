import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
///Payment exception messages is provided here
class PaymentException extends EBRException {
  PaymentException.init(String message) : super.init(message);
}
///Invalid card exception messages is provided here
class InvalidCardException extends PaymentException {
  InvalidCardException.init(String message) : super.init(message);
}
///Invalid transaction exception messages is provided here
class InvalidTransaction extends PaymentException {
  InvalidTransaction.init(String message) : super.init(message);
}
///Card in used exception messages is provided here
class CardInUsedException extends PaymentException {
  CardInUsedException.init(String message) : super.init(message);
}
