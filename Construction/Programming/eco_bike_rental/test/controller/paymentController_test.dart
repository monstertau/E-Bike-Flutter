import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
import 'package:eco_bike_rental/common/exception/payment_exception.dart';
import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:test/test.dart';

void main() {
  PaymentController paymentController = new PaymentController();
  group('Validate Payment Information Test', () {
    group('Validate cardCode', () {
      var cardCodes = [
        {"", false},
        {"12312312_group1_2020", true},
        {"#@ absasc", false}
      ];
      // var cardCodes = ["", "12312312_group1_2020", "#@ absasc"];
      cardCodes.forEach((element) {
        test("Test $element", () {
          bool isValid =
              paymentController.validateCardCode(element.elementAt(0));
          bool expectedValue = element.elementAt(1);
          expect(isValid, expectedValue);
        });
      });
    });
    group('Validate cvvCode', () {
      var cvvCodes = [
        {null, false},
        {123, false},
        {"123", true},
        {12312312, false}
      ];
      cvvCodes.forEach((element) {
        test("Test $element", () {
          bool isValid =
              paymentController.validateCvvCode(element.elementAt(0));
          bool expectedValue = element.elementAt(1);
          print(isValid);
          expect(isValid, expectedValue);
        });
      });
    });
    group('Validate date Expired', () {
      var dateExpireds = [
        {null, false},
        {"1230", true},
        {"12/32", false},
        {"1210", false},
        {"2222", false},
        {"1220", true}
      ];

      dateExpireds.forEach((element) {
        test("Test $element", () {
          bool isValid =
              paymentController.validateDateExpired(element.elementAt(0));
          bool expectedValue = element.elementAt(1);
          expect(isValid, expectedValue);
        });
      });
    });
    group('Validate owner', () {
      var owners = [
        {null, false},
        {"Nguyen Xuan Hoang", true},
        {"#@ nguyen Xuan Hoag", false},
      ];
      owners.forEach((element) {
        test("Test $element", () {
          bool isValid = paymentController.validateOwner(element.elementAt(0));
          bool expectedValue = element.elementAt(1);
          expect(isValid, expectedValue);
        });
      });
    });

    group('Deduct Money Test', () {
      CreditCard card =
          new CreditCard("121319_group10_2020", 323, "1125", "Group 10");
      test('Deduct ', () async {
        Map status;
        try {
          status = await paymentController.deductMoney(card, 0);
        } catch (e) {
          expect(e.runtimeType, InvalidTransaction);
        }
        expect(status, null);
      });
      test('Deduct 10000', () async {
        Map status;
        try {
          status = await paymentController.deductMoney(card, 10000);
        } catch (e) {
          expect(e, null);
        }
        expect(status["success"], true);
      });
      test('Deduct more than money in bank', () async {
        Map status;
        try {
          status = await paymentController.deductMoney(card, 1000000);
        } catch (e) {
          expect(e.runtimeType, InvalidTransaction);
        }
        expect(status, null);
      });
    });
    //
    group('Deposit Money Test', () {
      CreditCard card =
          new CreditCard("121319_group10_2020", 323, "1125", "Group 10");
      test('Deposit 0', () async {
        Map status;
        try {
          status = await paymentController.returnDepositMoney(card, 1000, 0);
        } catch (e) {
          expect(e, null);
        }
        expect(status["success"], true);
        expect(status['data']['command'], "refund");
        expect(status['data']['amount'], 1000);
      });
      test('Deposit 100000, rentAmount 10000', () async {
        Map status;
        try {
          status =
              await paymentController.returnDepositMoney(card, 100000, 10000);
        } catch (e) {
          expect(e, null);
        }
        expect(status["success"], true);
        expect(status['data']['command'], "refund");
        expect(status['data']['amount'], 90000);
      });

      test('Deposit 100000, rentAmount 120000', () async {
        Map status;
        try {
          status =
              await paymentController.returnDepositMoney(card, 100000, 120000);
        } catch (e) {
          expect(e, null);
        }
        expect(status["success"], true);
        expect(status['data']['command'], "pay");
        expect(status['data']['amount'], 20000);
      });
    });
  });
}
