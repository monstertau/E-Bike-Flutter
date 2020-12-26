import 'package:flutter/material.dart';

class SectionBanner extends StatelessWidget {
  final String title;

  const SectionBanner({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
      Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 36,
            )),
      ),
    ]);
  }
}
