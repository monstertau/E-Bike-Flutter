import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:flutter_test/flutter_test.dart';

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
        {312, true},
        {"123", false},
        {12312312, false}
      ];
      cvvCodes.forEach((element) {
        test("Test $element", () {
          bool isValid = paymentController.valideCvvCode(element.elementAt(0));
          bool expectedValue = element.elementAt(1);
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
      DateTime now = new DateTime.now();
      print(now.year.toString().substring(now.year.toString().length - 2));

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
  });

  group('Deduct Money Test', () {
    test('Deduct 0', () {});
    test('Deduct 10000', () {});
  });

  group('Deposite Money Test', () {
    test('Deposite 0', () {});
    test('Deduct 10000', () {});
  });
}
