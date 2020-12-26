import 'dart:convert';
import 'dart:io';

import 'package:eco_bike_rental/common/exception/server_exception.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

///Database boundary
class DatabaseBoundary {
  static final String publicKey = "841a6ad1b24833c266b8683ab63fc368348fa913";
  static final String secretKey = "40cc022cad1477cb5d5c79d65dc4f41057e98c65";
  static final String identifier = "GROUP10";

  ///Generate signature for database access
  static String generateSignature(String method, String body, String baseUrl) {
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

  ///make url
  static String _makeUrl(String path) {
    return baseUrl + path;
  }

  ///http get method with generated header signature
  static Future<http.Response> get(String path, {optionalQuery = ""}) async {
    try {
      String auth = generateSignature("GET", "", path);
      final response = await http.get(_makeUrl(path + optionalQuery),
          headers: {"Authorization": "$auth"});
      if (response.statusCode == 500) {
        throw ServerException.init("Server Error");
      }
      return response;
    } on SocketException {
      throw ServerException.init("Connection To Server Error");
    }
  }

  ///http post method with generated header signature
  static Future<http.Response> post(String path, Map body) async {
    try {
    String auth = generateSignature("POST", jsonEncode(body), path);
    final response = await http.post(_makeUrl(path),
        headers: {"Authorization": "$auth", "Content-Type": "application/json"},
        body: jsonEncode(body));
    if (response.statusCode == 500) {
      throw ServerException.init("Server Error");
    }
    return response;
    } on SocketException {
      throw ServerException.init("Connection To Server Error");
    }
  }
}
