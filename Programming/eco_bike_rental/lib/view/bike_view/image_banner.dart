import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetsPath;
  final String _itemName;
  final bool _itemStatus;

  ImageBanner(this._assetsPath, this._itemName, this._itemStatus);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          constraints: BoxConstraints.expand(
            height: 200.0,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(_assetsPath), fit: BoxFit.cover)),
        ),
        Column(
          children: [
            Text(_itemName),
            _itemStatus ? Text('AVAILABLE') : Text('RENTED'),
          ],
        )
      ],
    );
  }
}
