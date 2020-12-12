import 'package:flutter/material.dart';

class TextItem extends StatefulWidget {
  final String _key;
  final String _value;

  TextItem(this._key, this._value);

  @override
  _TextItemState createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(widget._key), Text(widget._value)],
      ),
    );
  }
}