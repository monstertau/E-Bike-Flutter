class API {
  static Map parseResponse(Map<String, dynamic> json) {
    return {"status": json['statusCode'], "body": json['body']};
  }
}
