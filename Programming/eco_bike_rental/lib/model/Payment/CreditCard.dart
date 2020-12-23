import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';
///credit card model
class CreditCard {
  String _cardCode;

  String get cardCode => _cardCode;
  String _owner;
  int _cvvCode;
  String _dateExpired;

  final DatabaseSubsystemInterface database = new DatabaseSubsystem();
///constructor
  CreditCard.init();
///constructor
  CreditCard(this._cardCode, this._cvvCode, this._dateExpired, this._owner);

  String get owner => _owner;

  int get cvvCode => _cvvCode;

  String get dateExpired => _dateExpired;
///check card in used or not
  Future<bool> checkInUse() async {
    var tmp = await database.checkLockCard(this._cardCode);
    print(tmp);
    return tmp['isLock'];
  }
}
