abstract class DatabaseSubsystemInterface {
  Future<List> getAllDock();
  Future<List> getDetailDock(int dockId);
  Future<Map> getBikeByBarcode(String barcode);
}
