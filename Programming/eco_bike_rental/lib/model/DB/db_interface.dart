abstract class DatabaseSubsystemInterface {
  Future<List> getAllDock();

  Future<List> getDetailDock(String dockId);

  Future<Map> getBike(int id);
}
