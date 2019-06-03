//TODO add pictures to model first

import 'dart:async';
import 'dart:ui' as ui;

import 'package:barber/Models/Font.dart';
import 'package:barber/Objects/SearchResultObjects.dart';
import 'package:barber/BarberFromFirebase.dart';
import 'package:barber/SearchResultPictureView.dart';
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
                    padding: EdgeInsets.only(
                        top: 15, bottom: 5, left: 25, right: 25),
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
    Image image = Image.asset("assets/images/" + widget.barber.images[0]);
    Completer<ui.Image> completer = new Completer<ui.Image>();

    image.image
        .resolve(new ImageConfiguration())
        .addListener((ImageInfo info, _) => completer.complete(info.image));
    return completer.future;
  }

  _getImages() {
    List<bool> visibilities = new List<bool>();
    List<GlobalKey> globalKeys = new List<GlobalKey>.generate(
        widget.barber.images.length, (i) => new GlobalKey());

    return List.generate(widget.barber.images.length, (index) {
      String image = widget.barber.images[index];
      visibilities.add(true);

      return Visibility(
        visible: visibilities[index],
        key: globalKeys[index],
        child: GestureDetector(
          onTap: () {
            final RenderBox fabRenderBox =
                globalKeys[index].currentContext.findRenderObject();
            final pictureSize = fabRenderBox.size;
            final pictureOffset = fabRenderBox.localToGlobal(Offset.zero);
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 250),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    PictureView(
                      imageDir: image,
                    ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        _buildTransition(
                            child, animation, pictureSize, pictureOffset, image),
              ),
            );
            setState(() {
              visibilities[index] = false;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/" + image,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      );
    });
  }

  _buildTransition(
    Widget page,
    Animation<double> animation,
    Size pictureSize,
    Offset pictureOffset,
    String image
  ) {
    if (animation.value == 1) return page;

    final borderTween = BorderRadiusTween(
      begin: BorderRadius.circular(10),
      end: BorderRadius.circular(0),
    );

    final sizeTween = SizeTween(
      begin: pictureSize,
      end: MediaQuery.of(context).size,
    );

    final offsetTween = Tween<Offset>(
      begin: pictureOffset,
      end: Offset.zero,
    );

    final easeInAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    );

    final offset = offsetTween.evaluate(easeInAnimation);
    final radius = borderTween.evaluate(easeInAnimation);
    final size = sizeTween.evaluate(easeInAnimation);

      Widget positionedClippedChild(Widget child) => Positioned(
      width: size.width,
      height: size.height,
      left: offset.dx,
      top: offset.dy,
      child: ClipRRect(
        borderRadius: radius,
        child: child,
      ));

      return Stack(
        children: <Widget>[
          
          positionedClippedChild(Image.asset("assets/images/" + image)),
        ],
      );
  }
}
