import 'package:eco_bike_rental/model/Payment/CreditCard.dart';

abstract class InterbankInterface {
  Future<Map> pay(CreditCard card, int amount);

  Future<Map> refund(CreditCard card, int amount);
}
