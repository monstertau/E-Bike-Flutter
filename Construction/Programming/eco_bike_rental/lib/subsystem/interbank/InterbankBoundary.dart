import 'package:http/http.dart' as http;
import 'dart:convert';

class InterbankBoundary {
  static Future<Map> patch(Map data) async {
    const url =
        'https://ecopark-system-api.herokuapp.com/api/card/processTransaction';
    final response = await http.patch(url,
        headers: {"Content-Type": "application/json"},
        body: JsonEncoder().convert(data));
    return jsonDecode(response.body);
  }
}
