import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool oneScreen;
  final bool centerTitle;
  final bool search;
  final VoidCallback callback;

  CustomAppBar(
      {Key key,
      this.title,
      this.oneScreen = false,
      this.centerTitle = false,
      this.search = false, this.callback})
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
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: widget.centerTitle,
        leading: widget.oneScreen
            ? null
            : IconButton(
                icon: new Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.grey[600],
                ),
                onPressed: () => Navigator.of(context).pop()),
        actions: widget.search
            ? [
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                  onTap: widget.callback,
                  child: Icon(
                    Icons.search,
                    size: 24.0,
                    color: Colors.black,
                  ),
                ))
              ]
            : [Container()]
        // bottom: PreferredSize(
        //     child: Container(
        //       color: Colors.grey[300],
        //       height: 1.0,
        //     ),
        //     preferredSize: Size.fromHeight(1.0)),
        );
  }
}
