import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InvoiceSreen();
}

class _InvoiceSreen extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        children: <Widget>[_cusRow1(), _cusRow2()],
                      ))),
              Center(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    Column(children: [
                      _label("PAYMENT"),
                      Container(
                        child: Column(
                          children: <Widget>[
                            _colorRow("Deduct Money", "-", "246,0000 VND",
                                Colors.red),
                            _colorRow("Deposite Money", "+", "200,000 VND",
                                Colors.green),
                            Divider(),
                            _colorRow(
                                "Subtotal", "-", "46,0000 VND", Colors.red),
                          ],
                        ),
                      )
                    ]),
                  ],
                ),
              )),
              Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        children: <Widget>[
                          Column(children: [
                            _label("DETAILS"),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  _colorRow(
                                      "Barcode", "", "3jk6ad2", Colors.black),
                                  _colorRow("Bike Information", "", "E-bike",
                                      Colors.black),
                                  _colorRow(
                                      "Time Rented", "", "3h11m", Colors.black),
                                ],
                              ),
                            )
                          ]),
                        ],
                      )))
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
        style: TextStyle(fontSize: 26),
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
              fontSize: 26,
            ),
          )),
    )
  ]);
}

Widget _cusRow1() {
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
                      "Invoice - 0046",
                      style: TextStyle(
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 32,
                          color: Colors.white),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "05-12-2020",
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
            "NGUYEN XUAN HOANG",
            style: TextStyle(
                // fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 32,
                color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

Widget _cusRow2() {
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
                  fontSize: 50,
                  color: Colors.white),
            ),
          ))
    ],
  );
}
