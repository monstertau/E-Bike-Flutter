import 'dart:convert';

import 'package:eco_bike_rental/utils/constants.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<Map> Patch(Map data) async {
    // var resObj = {};
    const url =
        'https://ecopark-system-api.herokuapp.com/api/card/processTransaction';
    final response = await http.patch(url,
        headers: {"Content-Type": "application/json"},
        body: JsonEncoder().convert(data));
    // Map resObj = parseResponse(jsonDecode(response.body));
    // logger.i(response.statusCode);
    // logger.i(response.body);
    // print(response);
    return jsonDecode(response.body);
    // return resObj;
  }

  static Map parseResponse(Map<String, dynamic> json) {
    return {"status": json['statusCode'], "body": json['body']};
  }
}
