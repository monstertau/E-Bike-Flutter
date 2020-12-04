import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PaymentController extends ControllerMVC {
  CreditCard _card;

//bankInterface

  CreditCard get card => _card;

  set card(CreditCard value) {
    _card = value;
  }

  Map deductMoney(card, amount) {
    //TODO
    return {"success": false};
  }

  Map returnDepositeMoney(card, amount) {
    //TODO
    return {"success": false};
  }

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

  bool checkAccountInfo(card) {
    //TODO
    print(card);
    return true;
  }

  void createPayment(amount, contents, cardCode, cvvCode, dateExpired, owner) {}
}
