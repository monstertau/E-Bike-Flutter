import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:eco_bike_rental/subsystem/interbank/InterbankSubsystemController.dart';

class InterbankSubsystem {
  InterbankController _conttroler;

  InterbankSubsystem() {
    this._conttroler = new InterbankController();
  }

  pay(CreditCard card, int amount) {
    var result = _conttroler.payOrder(card, amount);
    return result;
  }

  Future<Map> refund(CreditCard card, int amount) async {
    Map result = await _conttroler.returnOrder(card, amount);
    return result;
  }
}
