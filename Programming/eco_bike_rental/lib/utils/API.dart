import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  Future<String> Patch(String data) async {
    var url =
        'https://ecopark-system-api.herokuapp.com/api/card/processTransaction';
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: JsonEncoder().convert(data));
    print(response.statusCode);
    return "";
  }
}
