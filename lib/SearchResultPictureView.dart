import 'package:flutter/material.dart';

class PictureView extends StatefulWidget {
  final String imageDir;

  PictureView({Key key, this.imageDir})
      : assert(imageDir != null),
        super(key: key);

  _PictureViewState createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          child: Image.asset("assets/images/" + widget.imageDir),
        ),
      ),
    );
  }
}
