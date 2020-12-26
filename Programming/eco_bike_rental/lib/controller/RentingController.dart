import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/services/Bike/bike_service.dart';
import 'package:eco_bike_rental/services/Payment/payment_service.dart';
import 'package:uuid/uuid.dart';
///This [RentingController] handles all the business logic related to renting bike flows.
///* Manipulate data returned in services package and send to the view in MVC model
///* Accompany with services package, it plays the role of controller in MVC model
class RentingController {

  static RentingController _this;
  ///Create a singleton [RentingController] instance
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
  ///Generate a rental code in uuid form with timestamp
  ///* see more in [Uuid]
  String generateRentalCode() {
    var uuid = Uuid();
    return uuid.v1();
  }
  ///Calculate renting amount
  ///* Input: rent duration, base renting Amount, additional rent amount
  ///* Output: rent amount
  int calculateRentingAmount(
      Duration rentDuration, int baseRentAmount, int addRentAmount) {
    int rentTime = rentDuration.inSeconds;
    if(rentTime <=10*60)
      return 0;
    if (rentTime <= 30 * 60) {
      return baseRentAmount;
    }
    int addTime = ((rentTime - 30 * 60) / (15 * 60)).ceil();
    return baseRentAmount + addRentAmount * (addTime);
  }
  ///Calculate deposit money
  ///* Input: base rent amount
  ///* Output: deposit money
  int calculateDepositMoney(int baseRentAmount) {
    return (baseRentAmount * 40 / 100).round();
  }
  ///Calculate renting time
  ///* Input: starting time, ending time
  ///* Output: renting time
  Duration calculateRentingTime(DateTime startTime, DateTime endTime) {
    return endTime.difference(startTime.toLocal());
  }
}
