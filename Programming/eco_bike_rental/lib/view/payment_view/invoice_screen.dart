import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceScreen extends StatefulWidget {
  final Map invoice;
  final Bike bike;

  InvoiceScreen({Key key, @required this.invoice, this.bike}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InvoiceSreen();
}

// TextEditingValue card =
class _InvoiceSreen extends State<InvoiceScreen> {
  final logger = new Logger();
  @override
  Widget build(BuildContext context) {
    var data = widget.invoice;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
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
                          _cusRow1(data['rentalCode'], data['startRentTime'],
                              data['card']['cardName']),
                          _cusRow2(data)
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
                            _colorRow("Deposit Money", "+ ", "200,000 VND",
                                Colors.green),
                            _colorRow(
                                "Deduct Money",
                                data['amount'] != null ? "- " : "",
                                data['amount'] != null
                                    ? data['amount'].toString() + " VND"
                                    : "",
                                Colors.red),
                            Divider(),
                            _colorRow(
                                "Subtotal", "- ", "46,0000 VND", Colors.red),
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
                                  _colorRow("Barcode", "", widget.bike.barcode,
                                      Colors.black),
                                  _colorRow("Bike Category", "",
                                      widget.bike.category, Colors.black),
                                  // _colorRow(
                                  //     "Time Rented", "", "3h11m", Colors.black),
                                  _colorRow("Bike Color", "", widget.bike.color,
                                      Colors.black),
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
                      "Invoice - $iid",
                      style: TextStyle(
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 24,
                          color: Colors.white),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      startTime.toString().split(" ")[0],
                      style: TextStyle(
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 18,
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
              size: MediaQuery.of(context).size.height * 0.2,
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
