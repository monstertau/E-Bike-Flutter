import 'package:flutter/cupertino.dart';

class ItemList extends StatelessWidget {
  String _key;
  String _value;
  Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      // margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: this._color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this._key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(this._value)
        ],
      ),
    );
  }

  ItemList(this._key, this._value, this._color);
}