import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:eco_bike_rental/view/common/app_bar.dart';
import 'package:eco_bike_rental/view/common/section_banner.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:eco_bike_rental/utils/Utils.dart';
import 'choose_payment_screen.dart';

class InvoiceScreen extends StatefulWidget {
  final Payment invoice;

  InvoiceScreen(this.invoice);

  @override
  State<StatefulWidget> createState() => _InvoiceScreen();
}

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
                          _cusRow2(subtotal)
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
                      SectionBanner(title: "PAYMENT"),
                      Container(
                        child: Column(
                          children: <Widget>[
                            _colorRow(
                                "Deposit Money",
                                "-",
                                Utils.numberFormat(widget.invoice.depositAmount)
                                        .toString() +
                                    " VND",
                                Colors.red),
                            _colorRow(
                                "Return Money",
                                widget.invoice.rentAmount != null
                                    ? (subtotal > 0 ? "+" : " ")
                                    : "",
                                widget.invoice.rentAmount != null
                                    ? Utils.numberFormat(subtotal).toString() +
                                        " VND"
                                    : "",
                                subtotal > 0 ? Colors.green : Colors.red),
                            Divider(),
                            _colorRow(
                                "Rented Amount",
                                widget.invoice.rentAmount != null ? "-" : "",
                                widget.invoice.rentAmount != null
                                    ? Utils.numberFormat(widget.invoice.rentAmount).toString() +
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
                            SectionBanner(title: "DETAILS"),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  _colorRow(
                                      "Barcode",
                                      "",
                                      widget.invoice.bike.barcode,
                                      Colors.black),
                                  _colorRow(
                                      "Battery",
                                      "",
                                      widget.invoice.bike.getBattery(),
                                      Colors.black),
                                  _colorRow(
                                      "Bike Category",
                                      "",
                                      widget.invoice.bike.category,
                                      Colors.black),
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

Widget _colorRow(label, sign, money, color) {
  return Row(children: [
    Expanded(
      flex: 5,
      child: Container(
          child: Text(
        label,
        style: TextStyle(fontSize: 16),
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
              fontSize: 16,
            ),
          )),
    )
  ]);
}

Widget _cusRow1(iid, startTime, owner) {
  var id = iid.substring(iid.length - 7, iid.length);
  return Container(
    margin: EdgeInsets.all(15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Invoice - $id",
                        style: TextStyle(
                            // fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 15,
                            color: Colors.white),
                      )),
                  Divider(
                    thickness: 0.5,
                    color: Colors.white,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        startTime.toString().split(" ")[0],
                        style: TextStyle(
                            // fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 13,
                            color: Colors.white),
                      )),
                ],
              )),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.topRight,
            child: Text(
              owner,
              style: TextStyle(
                  // fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _cusRow2(subtotal) {
  return Container(
    margin: EdgeInsets.all(15),
    child: Row(
      children: [
        Expanded(
            flex: 5,
            child: LayoutBuilder(builder: (context, constraint) {
              return CardItem(
                color: Colors.white,
              );
            })),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${Utils.numberFormat(subtotal).toString()}",
                    style: TextStyle(
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "VND",
                    style: TextStyle(
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}
