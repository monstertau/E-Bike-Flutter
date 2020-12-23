import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:uuid/uuid.dart';
///renting controller
class RentingController {
  RentingController() {
    bikeModel = Bike.newBike();
    paymentModel = Payment.init();
  }

  Bike bikeModel;
  Payment paymentModel;

  ///request rent bike
  Future<Bike> requestRentBike(String barcode) async {
    Bike bike = await bikeModel.getBikeByBarcode(barcode);
    return bike;
  }

  bool lockBike(Bike bike) {
    // TODO: implement this
    return false;
  }

  bool unlockBike(Bike bike) {
    // TODO: implement this
    return false;
  }

  Future<Payment> getRentedBikeInformation(String rentalCode) async {
    Payment payment = await paymentModel.getPaymentInfo(rentalCode);
    return payment;
  }

  bool requestReturnBike(DockStation dock) {
    // TODO: implement this
    return false;
  }

  void returnBike(DockStation dock, Bike bike) {
    // TODO: implement this
  }

  String generateRentalCode() {
    var uuid = Uuid();
    return uuid.v1();
  }

  int calculateRentingAmount(
      Duration rentDuration, int baseRentAmount, int addRentAmount) {
    int rentTime = rentDuration.inSeconds;
    if (rentTime <= 30 * 60) {
      return baseRentAmount;
    }
    int addTime = ((rentTime - 30 * 60) / (15 * 60)).ceil();
    return baseRentAmount + addRentAmount * (addTime);
  }

  int calculateDepositMoney(int baseRentAmount) {
    return (baseRentAmount * 40 / 100).round();
  }

  Duration calculateRentingTime(DateTime startTime, DateTime endTime) {
    return endTime.difference(startTime.toLocal());
  }

}
