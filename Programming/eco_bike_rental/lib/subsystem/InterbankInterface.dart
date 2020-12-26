import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
///Interbank interface
abstract class InterbankInterface {
  Future<Map> pay(CreditCard card, int amount);

  Future<Map> refund(CreditCard card, int amount);
}
