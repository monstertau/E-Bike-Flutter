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
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(100, 0, 0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Text(
                        "Hello world",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Center(
                child: Text('2'),
              ),
              Center(
                child: Text('3'),
              )
            ]),
      ),
    );
  }
}
