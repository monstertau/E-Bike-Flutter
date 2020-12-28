import 'dart:convert';

import 'package:eco_bike_rental/model/DB/db_boundary.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:crypto/crypto.dart';

void main() {
  group('Test Generate Header', () {
    var testCase = [
      {
        "GET",
        "",
        "/dock/get-detail",
        "GROUP10 841a6ad1b24833c266b8683ab63fc368348fa913:YzI3M2RhNWE2MGY3NWFhNTc0NmRkZmNmNjI1YTIxY2RkYjg4ZDI5Mw=="
      },
      {
        "POST",
        '{"dockId":1,"bikeId":99}',
        "/bike/return-to-dock",
        "GROUP10 841a6ad1b24833c266b8683ab63fc368348fa913:ZGZlNDUwZDgzNzg3YjAwYTZhNmMxNzE1MTY0N2Y0NzY3NjhhN2IwMQ=="
      }
    ];
    testCase.forEach((element) {
      test("Test $element", () {
        String res = DatabaseBoundary.generateSignature(
            element.elementAt(0), element.elementAt(1), element.elementAt(2));
        var expected = element.elementAt(3);
        expect(res, expected);
      });
    });
  });
  test("test MD5 Hash", () {
    Map body = {"dockId": 1, "bikeId": 99};
    var test = md5.convert(utf8.encode(jsonEncode(body))).toString();
    print(test);
  });
}
