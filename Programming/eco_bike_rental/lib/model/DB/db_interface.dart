abstract class DatabaseSubsystemInterface {
  Future<List> getAllDock();

  Future<List> getDetailDock(int dockId);

  Future<Map> getBikeByBarcode(String barcode);

  Future<Map> checkLockCard(String cardCode);

  Future<Map> savePayment(Map payment);

  Future<Map> updatePayment(Map payment);

  Future<Map> searchPayment(String rentalCode);
}
