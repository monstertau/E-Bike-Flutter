import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceScreen extends StatefulWidget {
  final Payment invoice;

  // final Bike bike;

  // InvoiceScreen(Payment payment, {Key key, @required this.invoice, this.bike}) : super(key: key);
  InvoiceScreen(this.invoice);

  @override
  State<StatefulWidget> createState() => _InvoiceScreen();
}

// TextEditingValue card =
class _InvoiceScreen extends State<InvoiceScreen> {
  final logger = new Logger();

  @override
  Widget build(BuildContext context) {
    logger.i(widget.invoice.rentalCode);
    var subtotal = (widget.invoice.rentAmount != null
        ? widget.invoice.depositAmount - widget.invoice.rentAmount
        : -widget.invoice.depositAmount);
    return Scaffold(
      appBar:
      CustomAppBar(title: "Invoice", centerTitle: true, oneScreen: true),
      body: Container(
        child: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              Center(
                // child: FractionallySizedBox(
                //     heightFactor: 0.3,
                //     widthFactor: 0.7,
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        children: <Widget>[
                          _cusRow1(
                              widget.invoice.rentalCode,
                              widget.invoice.startRentTime,
                              widget.invoice.card.owner),
                          _cusRow2(widget.invoice)
                        ],
                      ))
                // )
              ),
              Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: <Widget>[
                        Column(children: [
                          _label("PAYMENT"),
                          Container(
                            child: Column(
                              children: <Widget>[
                                _colorRow(
                                    "Deposit Money",
                                    "-",
                                    widget.invoice.depositAmount.toString() +
                                        " VND",
                                    Colors.red),
                                _colorRow(
                                    "Return Money",
                                    widget.invoice.rentAmount != null
                                        ? (subtotal > 0 ? "+" : " ")
                                        : "--------",
                                    widget.invoice.rentAmount != null
                                        ? subtotal.toString() + " VND"
                                        : "",
                                    subtotal > 0 ? Colors.green : Colors.red),
                                Divider(),
                                _colorRow(
                                    "Rented Amount",
                                    widget.invoice.rentAmount != null
                                        ? "-"
                                        : "--------",
                                    widget.invoice.rentAmount != null
                                        ? widget.invoice.rentAmount.toString() +
                                        " VND"
                                        : "",
                                    Colors.red),
                              ],
                            ),
                          )
                        ]),
                      ],
                    ),
                  )),
              Center(
                  child: Container(
                      margin:
                      EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                      child: Column(
                        children: <Widget>[
                          Column(children: [
                            _label("DETAILS"),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  _colorRow(
                                      "Barcode",
                                      "",
                                      widget.invoice.bike.barcode,
                                      Colors.black),
                                  _colorRow(
                                      "Bike Category",
                                      "",
                                      widget.invoice.bike.category,
                                      Colors.black),
                                  // _colorRow(
                                  //     "Time Rented", "", "3h11m", Colors.black),
                                  _colorRow("Bike Color", "",
                                      widget.invoice.bike.color, Colors.black),
                                ],
                              ),
                            )
                          ]),
                        ],
                      ))),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6.0)),
                  margin: EdgeInsets.only(top: 25.0),
                  child: FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, homeRoute,
                                (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        Icons.home,
                        size: 32,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Back To Home",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      )),
                ),
              )
            ]),
      ),
    );
  }
}

Widget _label(title) {
  return Container(
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(bottom: 14.0),
    child: Text(
      title,
      style: TextStyle(
        // fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        fontSize: 32,
      ),
    ),
  );
}

Widget _colorRow(label, sign, money, color) {
  return Row(children: [
    Expanded(
      flex: 5,
      child: Container(
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          )),
    ),
    Expanded(
      flex: 5,
      child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            sign + money,
            style: TextStyle(
              color: color,
              fontSize: 20,
            ),
          )),
    )
  ]);
}

Widget _cusRow1(iid, startTime, owner) {
  var id = iid.split("-")[iid
      .split("-")
      .length - 1];
  print(iid);
  print(startTime);
  print(owner);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        flex: 5,
        child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Invoice - ***** $id",
                      style: TextStyle(
                        // fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 20,
                          color: Colors.white),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      startTime.toString().split(" ")[0],
                      style: TextStyle(
                        // fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 22,
                          color: Colors.white),
                    )),
              ],
            )),
      ),
      Expanded(
        flex: 5,
        child: Container(
          alignment: Alignment.topRight,
          child: Text(
            owner,
            style: TextStyle(
              // fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 16,
                color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

Widget _cusRow2(info) {
  return Row(
    children: [
      Expanded(
          flex: 5,
          child: LayoutBuilder(builder: (context, constraint) {
            return Icon(
              Icons.credit_card,
              color: Colors.white,
              size: MediaQuery
                  .of(context)
                  .size
                  .height * 0.2,
            );
          })),
      Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              "46,000\nVND",
              style: TextStyle(
                // fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 40,
                  color: Colors.white),
            ),
          ))
    ],
  );
}
