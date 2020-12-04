import 'package:logger/logger.dart';
import 'package:postgres/postgres.dart';

class DBConnection {
  static PostgreSQLConnection _connection;
  static PostgreSQLConnection getConnection() {
    var logger = Logger();
    if (_connection != null) {
      return _connection;
    }
    _connection = PostgreSQLConnection("localhost", 5432, "postgres",
        username: "monstertau", password: "trungdung99");
    logger.i("Connecting to Postgres DB...");
    return _connection;
  }
}
