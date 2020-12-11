import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static String getNow() {
    var now = (new DateTime.now()).toString();
    return (now.substring(0, now.length - 4));
  }

  static String makeHash(Map data) {
    final SECRET_KEY = "BUgboJpO5w4=";
    var hashData = data;
    hashData.putIfAbsent("secretKey", () => SECRET_KEY);
    return md5.convert(utf8.encode(hashData.toString())).toString();
  }
}
