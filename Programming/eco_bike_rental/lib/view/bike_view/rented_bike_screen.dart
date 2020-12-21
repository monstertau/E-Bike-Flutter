import 'dart:async';

import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'image_banner.dart';

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
  final RentingController rentingController = new RentingController();

  @override
  void initState() {
    super.initState();
    _getRentalCode().then((value) {
      if (value != null) {
        setState(() {
          _state = 1;
          _rentalCode = value;
          _payment = rentingController.getRentedBikeInformation(_rentalCode);
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
    String minutes = duration.inMinutes.remainder(60).toString();
    String seconds = duration.inSeconds.remainder(60).toString();
    return "$hour h:$minutes m:$seconds s";
  }

  Future<String> _getRentalCode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String rentalCode = pref.getString("rentalCode");
    return rentalCode;
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
          : SingleChildScrollView(
              child: FutureBuilder(
                  future: _payment,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData != null) {
                      Payment payment = snapshot.data;
                      Duration rentTime =
                          rentingController.calculateRentingTime(
                              payment.startRentTime, _rentEndTime);
                      int rentingAmount =
                          rentingController.calculateRentingAmount(
                              rentTime,
                              payment.bike.baseRentAmount,
                              payment.bike.addRentAmount);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ImageBanner("lib/assets/images/bike.jpg",
                              'Bike ${payment.bike.barcode}', true),
                          TextItem('Color', '${payment.bike.color}'),
                          TextItem('Battery Status', '50%'),
                          TextItem('Time Rented', _formatDateTime(rentTime)),
                          TextItem('Payment Amount', '$rentingAmount VND'),
                          RaisedButton(
                            onPressed: () {
                              payment.rentAmount = rentingAmount;
                              payment.endRentTime = _rentEndTime;
                              Navigator.pushNamed(context, confirmReturnRoute,
                                  arguments: payment);
                            },
                            child: Text("Confirm return bike"),
                          )
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
    );
  }

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
