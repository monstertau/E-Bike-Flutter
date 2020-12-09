import 'package:logger/logger.dart';
import 'package:postgres/postgres.dart';

abstract class DatabaseSubsystemInterface {

  Future<Map> getAllDock();

  Future<Map> getDetailDock(String dockId);
}
