import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool oneScreen;
  final bool centerTitle;

  CustomAppBar(
      {Key key, this.title, this.oneScreen = false, this.centerTitle = false})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: widget.centerTitle,
      leading: widget.oneScreen
          ? null
          : IconButton(
              icon: new Icon(Icons.arrow_back_outlined, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
      bottom: PreferredSize(
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0)),
    );
  }
}
