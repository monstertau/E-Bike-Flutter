import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DB/db_connection.dart';
import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/services/Payment/payment_service.dart';
import 'package:eco_bike_rental/subsystem/InterbankInterface.dart';
import 'package:eco_bike_rental/subsystem/InterbankSubsystem.dart';
import 'package:shared_preferences/shared_preferences.dart';

///This [PaymentController] handles all the business logic related to payment flows.
///* Manipulate data returned in services package
///* Accompany with services package, it plays the role of controller in MVC model
class PaymentController {
  InterbankInterface _interbank;
  PaymentService _paymentService = new PaymentService();

  ///This method is used for deducting money from card
  ///* Input: card entity, amount to deduct
  ///* Output: <Map> of result
  Future<Map> deductMoney(card, amount) async {
    //TODO
    Map result;
    this._interbank = new InterbankSubsystem();
    try {
      result = await _interbank.pay(card, amount);
    } catch (e) {
      throw (e);
    }
    return result;
  }

  ///This method is used for returning deposit money to card
  ///* Input: card entity, deposit amount, and rent amount
  ///* Output: <Map> of result
  Future<Map> returnDepositMoney(card, deposit, rentAmount) async {
    //TODO
    Map result;
    int amount;
    this._interbank = new InterbankSubsystem();
    try {
      amount = deposit - rentAmount;
      if (amount < 0) {
        result = await _interbank.pay(card, -amount);
      } else
        result = await _interbank.refund(card, amount);
    } catch (e) {
      // print(e);
      throw (e);
    }
    return result;
  }

  ///This method is used for validating card code
  ///* Input: card code
  ///* Output: true or false
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

  ///This method is used for validating cvv code
  ///* Input: cvv code
  ///* Output: true or false
  bool validateCvvCode(cvvCode) {
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

  ///This method is used for validating expiration date
  ///* Input: expiration date
  ///* Output: true or false
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

  ///This method is used for validating owner name
  ///* Input: owner name
  ///* Output: true or false
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

  ///This method create an instance of payment with full of initial value
  Payment createPayment(
      Bike bike, int depositMoney, DateTime start, String rentalCode) {
    return new Payment(
        bike, CreditCard.init(), start, depositMoney, "0", rentalCode);
  }
  ///This method is used for saving payment
  void savePayment(Payment payment, cardId) async =>
      await _paymentService.save(payment, cardId);
  ///This method is used for updating payment
  Future<Map> updatePayment(Payment payment) async {
    return await _paymentService.update(payment);
  }
  ///This method is used for saving [RentalCode] to local device
  Future<void> saveRentalCodeToLocal(String rentalCode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("rentalCode", rentalCode);
  }
  ///This method is used for getting [RentalCode] from local device
  Future<String> getRentalCodeFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String rentalCode = pref.getString("rentalCode");
    return rentalCode;
  }
}
