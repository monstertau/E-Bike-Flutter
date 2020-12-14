import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/subsystem/InterbankSubsystem.dart';
import 'package:eco_bike_rental/subsystem/interbank/InterbankBoundary.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PaymentController extends ControllerMVC {
  CreditCard _card;

// ignore: todo
  InterbankSubsystem _interbank;

  CreditCard get card => _card;

  set card(CreditCard value) {
    _card = value;
  }

  // Description: Deduct money from card
  // @param: - creditCard card - card information
  //         - Int amount - amount of money
  // @return - Map message information
  Future<Map> deductMoney(card, amount) async {
    //TODO
    Map result;
    this._interbank = new InterbankSubsystem();
    try {
      result = await _interbank.pay(card, amount);
    } catch (e) {
      print(e);
      result = {"success": false, "message": e.toString()};
    }
    return result;
  }

  // Description: Deposite money to card
  // @param: - creditCard card - card information
  //         - Int amount - amount of money
  // @return - Map message information
  Future<Map> returnDepositeMoney(card, amount) async {
    //TODO
    Map result;
    this._interbank = new InterbankSubsystem();
    try {
      result = await _interbank.refund(card, amount);
    } catch (e) {
      print(e);
      result = {"success": false, "message": e.toString()};
    }
    return result;
  }

  // Description: validate cardCode of CreditCard
  // @param: - String cardCode - card code of CreditCard
  // @return - true if valid
  bool validateCardCode(cardCode) {
    //TODO
    RegExp regexCardCode =
        new RegExp(r"^[a-zA-Z0-9][a-zA-Z0-9 \\-\\.\\_\\,\\/]*$");
    try {
      if (cardCode == null) return false;
      return regexCardCode.hasMatch(cardCode);
    } catch (e) {
      return false;
    }
  }

  // Description: validate cvvCode of CreditCard
  // @param: - String cvvCode - cvv code of CreditCard
  // @return - true if valid
  bool valideCvvCode(cvvCode) {
    //TODO
    try {
      if (cvvCode == null) return false;
      int.parse(cvvCode);
      if (cvvCode.length != 3) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  // Description: validate dateExpired of CreditCard
  // @param: - String dateExpired - expired date of CreditCard
  // @return - true if valid
  bool validateDateExpired(dateExpired) {
    //TODO
    if (dateExpired == null) return false;
    try {
      if (dateExpired.length > 4) return false;
      DateTime now = new DateTime.now();
      var month = int.parse(dateExpired.substring(0, 2));
      var year = int.parse(dateExpired.substring(2, 4));

      if (month < 0 || month > 12) return false;
      var nowYear = int.parse(
          now.year.toString().substring(now.year.toString().length - 2));
      if (nowYear > year)
        return false;
      else if (nowYear == year) {
        if (month < now.month) return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // Description: validate owner of CreditCard
  // @param: - String owner - owner of CreditCard
  // @return - true if valid
  bool validateOwner(owner) {
    //TODO
    RegExp ownerRegex = new RegExp(r"^[a-zA-Z ]*$");
    if (owner == null) return false;
    try {
      return ownerRegex.hasMatch(owner);
    } catch (e) {
      return false;
    }
  }

  // Description: validate the Account Info
  // @param: - CreditCard card - credit card need to check
  // @return - true if valid
  bool checkAccountInfo(card) {
    //TODO
    print(card);
    return true;
  }

  // Description: create new payment
  // @param: - int amount - amount of money
  //         - String contents - contents of payment
  //         - CreditCard card - credit card
  Payment createPayment(Bike bike,double depositMoney,DateTime start,String rentalCode ) {
    return new Payment(bike, CreditCard.init(), 0, start, "0", rentalCode);
  }
}
