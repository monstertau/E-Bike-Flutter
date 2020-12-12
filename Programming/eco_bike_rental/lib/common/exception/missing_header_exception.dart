import 'package:http/http.dart';

class MissingHeaderException extends ClientException{
  MissingHeaderException() : super("Missing Authorization Header");

}