import 'dart:async';
import 'dart:ui' as ui;

import 'package:barber/Models/Font.dart';
import 'package:barber/Objects/SearchResultObjects.dart';
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
    return ListView(
      
      children: <Widget>[
        SearchResultObjects.getTopLabel("Pictures"),
        Divider(),
        FutureBuilder<ui.Image>(
            future: _getImageFuture(),
            builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              if (snapshot.hasData) {
                ui.Image image = snapshot.data;

                return GridView.count(
                  shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 2,
                    padding:
                        EdgeInsets.only(top: 15, bottom: 5, left: 25, right: 25),
                    crossAxisSpacing: 15,
                    childAspectRatio: (image.width / image.height),
                    mainAxisSpacing: 25,
                    children: _getImages());
              } else
                return new Container();
            }),
      ],
    );
  }

  Future<ui.Image> _getImageFuture() {
    Image image = Image.asset("assets/images/" + widget.barber.images[0].link);
    Completer<ui.Image> completer = new Completer<ui.Image>();

    image.image
        .resolve(new ImageConfiguration())
        .addListener((ImageInfo info, _) => completer.complete(info.image));
    return completer.future;
  }

  _getImages() {
    List<Widget> images = new List<Widget>();

    // TODO (Remove after testing) Do it few times to show the whole list
    for (var x = 0; x < 6; x++) {
      // Getting each of the images and then add to images list
      widget.barber.images.forEach(
            (element) =>
            images.add(

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/" + element.link,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),

      );
    }

    return images;
  }
}
