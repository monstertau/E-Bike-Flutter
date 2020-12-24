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
}
