import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:eco_bike_rental/subsystem/InterbankInterface.dart';
import 'package:eco_bike_rental/subsystem/interbank/InterbankSubsystemController.dart';

class InterbankSubsystem implements InterbankInterface{
  InterbankController _controller;

  InterbankSubsystem() {
    this._controller = new InterbankController();
  }

  Future<Map> pay(CreditCard card, int amount) {
    var result = _controller.payOrder(card, amount);
    return result;
  }

  Future<Map> refund(CreditCard card, int amount) async {
    Map result = await _controller.returnOrder(card, amount);
    return result;
  }
}
