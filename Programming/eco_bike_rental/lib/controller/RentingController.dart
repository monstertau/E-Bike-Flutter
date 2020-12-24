import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:uuid/uuid.dart';
///This [RentingController] maintain all the logical business related to renting a [Bike]
///* connecting with the database and retrieving information
///* return necessary information to display in the view
class RentingController {
  RentingController() {
    bikeModel = Bike.newBike();
    paymentModel = Payment.init();
  }

  Bike bikeModel;
  Payment paymentModel;

  ///Request rent bike by sending barcode
  Future<Bike> requestRentBike(String barcode) async {
    Bike bike = await bikeModel.getBikeByBarcode(barcode);
    return bike;
  }

  ///Locking a bike by lock attribute
  bool lockBike(Bike bike) {
    // TODO: implement this
    return false;
  }
  ///Unlocking a bike by lock attribute
  bool unlockBike(Bike bike) {
    // TODO: implement this
    return false;
  }

  ///Get rent bike information by sending @param [rentalCode]
  Future<Payment> getRentedBikeInformation(String rentalCode) async {
    Payment payment = await paymentModel.getPaymentInfo(rentalCode);
    return payment;
  }
  ///request return a bike by sending the dock information ([DockId])
  bool requestReturnBike(DockStation dock) {
    // TODO: implement this
    return false;
  }

  ///confirm return bike
  void returnBike(DockStation dock, Bike bike) {
    // TODO: implement this
  }

  String generateRentalCode() {
    var uuid = Uuid();
    return uuid.v1();
  }

  ///calculate the renting amount to pay
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
