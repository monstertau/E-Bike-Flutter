import 'package:eco_bike_rental/model/DB/db_controller.dart';

class DatabaseConnection {
  DatabaseConnection._();

  factory DatabaseConnection() {
    if (_this == null) _this = DatabaseConnection._();
    return _this;
  }

  static DatabaseConnection _this;

  DatabaseConnectionController _con = new DatabaseConnectionController();

  Future<List> getAllDock() async {
    Map response = await _con.getAllDock();
    return response["docks"];
  }

  Future<List> getDetailDock(int dockId) async {
    Map response = await _con.getDetailDock(dockId);
    return response["bikes"];
  }

  Future<Map> getBikeByBarcode(String barcode) async {
    Map response = await _con.getBikeByBarcode(barcode);
    return response["bike"];
  }

  Future<Map> checkLockCard(String cardCode) async {
    Map response = await _con.checkLockedCard(cardCode);
    return response;
  }

  Future<Map> savePayment(Map payment) async {
    Map response = await _con.savePayment(payment);
    return response;
  }

  Future<Map> updatePayment(Map payment) async {
    Map response = await _con.updatePayment(payment);
    return response;
  }

  Future<Map> searchPayment(String rentalCode) async {
    Map response = await _con.searchPayment(rentalCode);
    return response["payment"];
  }
}
