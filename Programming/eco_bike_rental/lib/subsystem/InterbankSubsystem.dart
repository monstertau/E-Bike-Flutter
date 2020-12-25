import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/subsystem/InterbankInterface.dart';
import 'package:eco_bike_rental/subsystem/interbank/InterbankSubsystemController.dart';
///This class is for interbank subsystem
class InterbankSubsystem implements InterbankInterface{
  InterbankController _controller;
///Constructor for Interbank subsystem
  InterbankSubsystem() {
    this._controller = new InterbankController();
  }
///This class return a [Map] of result of pay order
  Future<Map> pay(CreditCard card, int amount) {
    var result = _controller.payOrder(card, amount);
    return result;
  }
  ///This class return a [Map] of result of refund
  Future<Map> refund(CreditCard card, int amount) async {
    Map result = await _controller.returnOrder(card, amount);
    return result;
  }
}
