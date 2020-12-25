import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/services/Bike/bike_service.dart';
import 'package:eco_bike_rental/services/Payment/payment_service.dart';
import 'package:uuid/uuid.dart';
///This [RentingController] handles all the business logic related to renting bike flows.
///* Manipulate data returned in services package
///* Accompany with services package, it plays the role of controller in MVC model
class RentingController {

  static RentingController _this;

  factory RentingController() {
    if (_this == null) _this = RentingController._();
    return _this;
  }

  RentingController._();
  ///Instantiate [BikeService]
  BikeService _bikeService = new BikeService();
  ///Instantiate [PaymentService]
  PaymentService _paymentService = new PaymentService();
  ///Request to rent a bike
  ///* Input: Barcode
  ///* Output: bike entity
  Future<Bike> requestRentBike(String barcode) async {
    Bike bike = await _bikeService.getBikeByBarcode(barcode);
    return bike;
  }
  ///Get rented bike information by rental code
  Future<Payment> getRentedBikeInformation(String rentalCode) async {
    Payment payment = await _paymentService.getPaymentInfo(rentalCode);
    return payment;
  }
  ///Make a request of returning bike in which dock
  bool requestReturnBike(DockStation dock) {
    // TODO: implement this
    return false;
  }
  ///Return a bike
  void returnBike(DockStation dock, Bike bike) {
    // TODO: implement this
  }
  ///Generate a rental code in uuid form
  ///* see more in [Uuid]
  String generateRentalCode() {
    var uuid = Uuid();
    return uuid.v1();
  }
  ///Calculate renting amount: baseAmount*x + rentAmount*y
  int calculateRentingAmount(
      Duration rentDuration, int baseRentAmount, int addRentAmount) {
    int rentTime = rentDuration.inSeconds;
    if (rentTime <= 30 * 60) {
      return baseRentAmount;
    }
    int addTime = ((rentTime - 30 * 60) / (15 * 60)).ceil();
    return baseRentAmount + addRentAmount * (addTime);
  }
  ///Calculate deposit money
  int calculateDepositMoney(int baseRentAmount) {
    return (baseRentAmount * 40 / 100).round();
  }
  ///Calculate renting time
  Duration calculateRentingTime(DateTime startTime, DateTime endTime) {
    return endTime.difference(startTime.toLocal());
  }
}
