import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/services/Bike/bike_service.dart';
import 'package:eco_bike_rental/services/Payment/payment_service.dart';
import 'package:uuid/uuid.dart';

class RentingController {
  static RentingController _this;

  factory RentingController() {
    if (_this == null) _this = RentingController._();
    return _this;
  }

  RentingController._();

  BikeService _bikeService = new BikeService();
  PaymentService _paymentService = new PaymentService();

  Future<Bike> requestRentBike(String barcode) async {
    Bike bike = await _bikeService.getBikeByBarcode(barcode);
    return bike;
  }

  Future<Payment> getRentedBikeInformation(String rentalCode) async {
    Payment payment = await _paymentService.getPaymentInfo(rentalCode);
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
