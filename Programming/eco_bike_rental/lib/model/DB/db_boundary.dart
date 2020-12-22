import 'dart:convert';

import 'package:eco_bike_rental/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class DatabaseBoundary {
  final String publicKey = "841a6ad1b24833c266b8683ab63fc368348fa913";
  final String secretKey = "40cc022cad1477cb5d5c79d65dc4f41057e98c65";
  final String identifier = "GROUP10";

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
    final keyBytes = utf8.encode(secretKey);
    Digest dig = new Hmac(sha1, keyBytes).convert(dataBytes);
    String hashStr = base64.encode(utf8.encode(dig.toString()));
    String res = "$identifier $publicKey:$hashStr";
    return res;
  }

  String _makeUrl(String path) {
    return baseUrl + path;
  }

  Future<http.Response> get(String path, {optionalQuery = ""}) async {
    String auth = generateSignature("GET", "", path);
    final response = await http.get(_makeUrl(path + optionalQuery),
        headers: {"Authorization": "$auth"});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      logger.i(response.body);
      throw Exception("Something went wrong");
    }
  }

  Future<http.Response> post(String path, Map body) async {
    String auth = generateSignature("POST", jsonEncode(body), path);
    final response = await http.post(_makeUrl(path),
        headers: {
          "Authorization": "$auth",
          "Content-Type": "application/json"
        },
        body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      logger.i(response.body);
      throw Exception("Something went wrong");
    }
  }
}
