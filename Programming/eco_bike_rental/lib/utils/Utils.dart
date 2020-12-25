import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class Utils {
  static final oCcy = new NumberFormat("#,##0", "en_US");
///Get the date in type of day & month
  static String getNow() {
    var now = (new DateTime.now()).toString();
    return (now.substring(0, now.length - 4));
  }

/// make hash for interbank request
  static String makeHash(Map data) {
    final secretKey = "BUgboJpO5w4=";
    var hashData = data;
    hashData.putIfAbsent("secretKey", () => secretKey);
    return md5.convert(utf8.encode(hashData.toString())).toString();
  }
  ///Format money currency
  static numberFormat(int number) {
    return oCcy.format(number);
  }
}
