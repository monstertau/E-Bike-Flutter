import 'package:eco_bike_rental/model/DB/db_controller.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
///Database subsystem
class DatabaseSubsystem implements DatabaseSubsystemInterface {
  DatabaseSubsystemController _con;
///constructor
  DatabaseSubsystem() {
    this._con = new DatabaseSubsystemController();
  }
///get all dock
  @override
  Future<List> getAllDock() async {
    // TODO: implement getAllDock
    Map response = await _con.getAllDock();
    return response["docks"];
  }
/// get detail dock
  @override
  Future<List> getDetailDock(int dockId) async {
    Map response = await _con.getDetailDock(dockId);
    return response["bikes"];
  }
///get bike by barcode
  @override
  Future<Map> getBikeByBarcode(String barcode) async {
    Map response = await _con.getBikeByBarcode(barcode);
    return response["bike"];
  }
///check locked card
  @override
  Future<Map> checkLockCard(String cardCode) async {
    // TODO: implement checkLockCard
    Map response = await _con.checkLockedCard(cardCode);
    return response;
  }

  @override
  Future<Map> savePayment(Map payment) async {
    // TODO: implement savePayment
    Map response = await _con.savePayment(payment);
    return response;
  }

  @override
  Future<Map> updatePayment(Map payment) async {
    // TODO: implement updatePayment
    Map response = await _con.updatePayment(payment);
    return response;
  }

  @override
  Future<Map> searchPayment(String rentalCode) async {
    // TODO: implement searchPayment
    Map response = await _con.searchPayment(rentalCode);
    return response["payment"];
  }
}
