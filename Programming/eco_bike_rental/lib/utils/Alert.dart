import 'package:eco_bike_rental/common/exception/ebr_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertCustom {
  static Alert show(context, e, type) {
    return Alert(
        context: context,
        type: type,
        title: type.toString().split("AlertType.")[1].toUpperCase(),
        desc: e is EBRException ? e.message : e,
        buttons: [
          DialogButton(
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 100,
          )
        ]);
  }
}
