import 'package:eco_bike_rental/model/DB/db_connection.dart';
import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';

class CreditCardService {
  factory CreditCardService() {
    if (_this == null) _this = CreditCardService._();
    return _this;
  }

  CreditCardService._();

  static CreditCardService _this;
  DatabaseConnection _database = new DatabaseConnection();

  Future<bool> checkInUse(CreditCard card) async {
    var tmp = await _database.checkLockCard(card.cardCode);
    print(tmp);
    return tmp['isLock'];
  }

  Future<bool> unlockCard(int cardId) async {
    bool response = await _database.unlockCard(cardId);
    return response;
  }

  Future<bool> lockCard(int cardId) async {
    bool response = await _database.lockCard(cardId);
    return response;
  }

  Future<int> searchOrCreateCard(CreditCard card) async {
    Map cardReq = {
      "cardCode": card.cardCode,
      "cardName": card.owner,
      "dateExpired": card.dateExpired,
      "cvvCode": card.cvvCode
    };

    int cardId = await _database.searchOrCreateCard(cardReq);
    return cardId;
  }
}
