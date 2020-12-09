import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:http/http.dart' as http;

class DatabaseSubsystemController {
  final String PUBLIC_KEY = "841a6ad1b24833c266b8683ab63fc368348fa913";
  final String SECRET_KEY = "40cc022cad1477cb5d5c79d65dc4f41057e98c65";
  final String IDENTIFIER = "GROUP10";

  String generateSignature(String method, String body, String baseUrl) {
    String contentMD5 = "";
    String type = "";
    if (method != 'GET') {
      contentMD5 = md5.convert(utf8.encode(body)).toString();
      type = "application/json";
    }
    String stringToSign =
        method + "\n" + contentMD5 + "\n" + type + "\n" + baseUrl;

    final dataBytes = utf8.encode(stringToSign);
    final keyBytes = utf8.encode(SECRET_KEY);
    Digest dig = new Hmac(sha1, keyBytes).convert(dataBytes);
    String hashStr = base64.encode(utf8.encode(dig.toString()));
    String res = "${IDENTIFIER} ${PUBLIC_KEY}:${hashStr}";
    return res;
  }

  String _makeUrl(String path) {
    return baseUrl + path;
  }

  Future<Map> getAllDock() async {
    String auth = generateSignature("GET", "", getAllDockPath);
    final response = await http
        .get(_makeUrl(getAllDockPath), headers: {"Authorization": "${auth}"});
    return jsonDecode(response.body);
  }
}
