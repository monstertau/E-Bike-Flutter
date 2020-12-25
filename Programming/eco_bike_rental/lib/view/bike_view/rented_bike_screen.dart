import 'dart:async';

import 'package:eco_bike_rental/controller/PaymentController.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/Utils.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:eco_bike_rental/view/common/section_banner.dart';
import 'package:flutter/material.dart';
import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:flutter/painting.dart';

class RentedBikeScreen extends StatefulWidget {
  @override
  _RentedBikeScreenState createState() => _RentedBikeScreenState();
}

class _RentedBikeScreenState extends State<RentedBikeScreen> {
  int _state = 0;
  String _rentalCode;
  DateTime _rentEndTime;
  Timer _timer;
  Future<Payment> _payment;
  RentingController _rentingController = new RentingController();
  PaymentController _paymentController = new PaymentController();
  @override
  void initState() {
    super.initState();
    _paymentController.getRentalCodeFromLocal().then((value) {
      if (value != null) {
        setState(() {
          _state = 1;
          _rentalCode = value;
          _payment = _rentingController.getRentedBikeInformation(_rentalCode);
        });
      }
    });

    _timer = Timer.periodic(Duration(seconds: 1), _onTimeChange);
    _rentEndTime = DateTime.now();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onTimeChange(Timer timer) {
    setState(() {
      _rentEndTime = DateTime.now();
    });
  }

  String _formatDateTime(Duration duration) {
    String hour = duration.inHours.toString();
    String minutes = "${duration.inMinutes.remainder(60)}";
    String seconds = "${duration.inSeconds.remainder(60)}";
    return "$hour :$minutes :$seconds ";
  }

  Widget _rentalDetailRow(String key, String value) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$key:"),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _rentalDetail(String depositAmount, String bikeType, String barcode) {
    return Column(
      children: [
        _rentalDetailRow("Deposited", depositAmount),
        _rentalDetailRow("Bike Type", bikeType),
        _rentalDetailRow("Bike Barcode", barcode)
      ],
    );
  }

  Widget _sessionItem(String key, String value) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
        Text(
          key,
          style: TextStyle(
              fontWeight: FontWeight.w300, color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 60.0,
      width: 0.5,
      color: Colors.grey,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }

  Widget _sessionDetail(String battery, String timeRented, int rentingAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _sessionItem("Battery", battery)),
        _verticalDivider(),
        Expanded(child: _sessionItem("Time Rented", timeRented)),
        _verticalDivider(),
        Expanded(child: _sessionItem("Rent Amount", "${Utils.numberFormat(rentingAmount)} VND")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Rented Bike",
        centerTitle: true,
        oneScreen: true,
      ),
      body: _state == 0
          ? Center(child: Text("No rented bike yet."))
          : Container(
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: _payment,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData != null) {
                        Payment payment = snapshot.data;
                        Duration rentTime =
                            _rentingController.calculateRentingTime(
                                payment.startRentTime, _rentEndTime);
                        int rentingAmount =
                            _rentingController.calculateRentingAmount(
                                rentTime,
                                payment.bike.bikeInfo.baseRentAmount,
                                payment.bike.bikeInfo.addRentAmount);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              payment.bike.imagePath,
                              fit: BoxFit.fitWidth,
                              height: 200,
                            ),
                            SectionBanner(title: "RENTAL DETAIL"),
                            _rentalDetail(
                                "${Utils.numberFormat(payment.depositAmount)} VND",
                                payment.bike.category,
                                "#${payment.bike.bikeInfo.barcode}"),
                            SectionBanner(title: "SESSION SUMMARY"),
                            _sessionDetail(payment.bike.showBattery(),
                                _formatDateTime(rentTime), rentingAmount),
                            Container(margin: EdgeInsets.only(bottom: 15,top: 15)),
                            FlatButton(
                                onPressed: () {
                                  payment.rentAmount = rentingAmount;
                                  payment.endRentTime = _rentEndTime;
                                  Navigator.pushNamed(
                                      context, confirmReturnRoute,
                                      arguments: payment);
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15, bottom: 15, left: 5, right: 5),
                                    child: Text("RETURN BIKE")),
                                textColor: Colors.white,
                                color: Color(0xFF126872),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)))
                          ],
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextItem(String key, String value) {
    return Container(
      color: Colors.grey[400],
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(key), Text(value)],
      ),
    );
  }
}
