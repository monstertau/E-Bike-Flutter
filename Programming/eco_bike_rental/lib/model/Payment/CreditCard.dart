import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';

class CreditCard {
  String _cardCode;

  String get cardCode => _cardCode;
  String _owner;
  int _cvvCode;
  String _dateExpired;

  final DatabaseSubsystemInterface database = new DatabaseSubsystem();

  CreditCard.init();

  CreditCard(this._cardCode, this._cvvCode, this._dateExpired, this._owner);

  String get owner => _owner;

  int get cvvCode => _cvvCode;

  String get dateExpired => _dateExpired;

  Future<bool> checkInUse() async {
    var tmp = await database.checkLockCard(this._cardCode);
    return tmp['lock'];
  }
}
