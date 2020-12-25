import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/services/CreditCard/credit_card_service.dart';
///This [CreditCardController] handles all the business logic related to [Card] entity.
///* Manipulate data returned in services package and send to the view in MVC model
///* Accompany with services package, it plays the role of controller in MVC model
class CreditCardController {
  static CreditCardController _this;
  CreditCardService _creditCardService = new CreditCardService();

  CreditCardController._();
///Create a singleton [CreditCardController] instance
  factory CreditCardController() {
    if (_this == null) _this = CreditCardController._();
    return _this;
  }
///Check available card
  ///* Input: card entity
  ///* Output: card status
  Future<bool> checkInUse(CreditCard card) async {
    bool isInUse = await _creditCardService.checkInUse(card);
    return isInUse;
  }
///Unlock card
  ///* Input: cardId
  ///* Output: card status
  Future<bool> unlockCard(int cardId) async =>
      await _creditCardService.unlockCard(cardId);
  ///Lock card
  ///* Input: cardId
  ///* Output: card status
  Future<bool> lockCard(int cardId) async =>
      await _creditCardService.lockCard(cardId);
///Search for card if existed and create new card if not
  ///* Input: card entity
  ///* Output: cardId
  Future<int> searchOrCreateCard(CreditCard card) async {
    int cardId = await _creditCardService.searchOrCreateCard(card);
    return cardId;
  }
}
