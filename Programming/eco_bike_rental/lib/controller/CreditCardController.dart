import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/services/CreditCard/credit_card_service.dart';

class CreditCardController {
  static CreditCardController _this;
  CreditCardService _creditCardService = new CreditCardService();

  CreditCardController._();

  factory CreditCardController() {
    if (_this == null) _this = CreditCardController._();
    return _this;
  }

  Future<bool> checkInUse(CreditCard card) async {
    bool isInUse = await _creditCardService.checkInUse(card);
    return isInUse;
  }
}
