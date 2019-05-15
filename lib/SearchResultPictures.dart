import 'package:barber/Models/Font.dart';
import 'package:barber/json/response.dart';
import 'package:flutter/material.dart';

class SearchResultPictures extends StatefulWidget {
  final Barber barber;
  _SearchResultPicturesState createState() => _SearchResultPicturesState();

  SearchResultPictures({Key key, this.barber}) : super(key: key);
}

class _SearchResultPicturesState extends State<SearchResultPictures> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 25, right: 25),
      crossAxisSpacing: 15,
      mainAxisSpacing: 25,

      children: <Widget>[
        for (var x = 0; x < 8; x++) _getImage(x),
      ],
    );
  }

  _getImage(int index) {
    return Image.asset("assets/images/barber2.jpg", fit: BoxFit.fitWidth,);
  }
}
