import 'dart:async';
import 'dart:ui' as ui;

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
    return FutureBuilder<ui.Image>(
        future: _getImageFuture(),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          if (snapshot.hasData) {
            ui.Image image = snapshot.data;

            return GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.only(top: 15, bottom: 5, left: 25, right: 25),
              crossAxisSpacing: 15,
              childAspectRatio: (image.width/image.height),
              mainAxisSpacing: 25,
              children: <Widget>[
                for (var x = 0; x < 8; x++) _getImage(x),
              ],
            );
          }
          else return new Container();
        });
  }

  Future<ui.Image> _getImageFuture() {
    Image image = Image.asset("assets/images/barber1.jpg");
    Completer<ui.Image> completer = new Completer<ui.Image>();

    image.image
        .resolve(new ImageConfiguration())
        .addListener((ImageInfo info, _) => completer.complete(info.image));
    return completer.future;
  }

  _getImage(int index) {
    return Image.asset(
      "assets/images/barber2.jpg",
      fit: BoxFit.fitWidth,
    );
  }
}
