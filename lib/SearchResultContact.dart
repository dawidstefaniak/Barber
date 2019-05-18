import 'package:barber/Models/Font.dart';
import 'package:barber/Objects/SearchResultObjects.dart';
import 'package:barber/BarberFromFirebase.dart';
import 'package:flutter/material.dart';

class SearchResultContact extends StatefulWidget {
  final Barber barber;
  _SearchResultContactState createState() => _SearchResultContactState();

  SearchResultContact({Key key, this.barber}) : super(key: key);
}

class _SearchResultContactState extends State<SearchResultContact> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SearchResultObjects.getTopLabel("Contact details"),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
          child: Text(widget.barber.name, style: TextStyle(fontSize: 24),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8),
          child: Text(widget.barber.address, style: TextStyle(fontSize: 24),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(widget.barber.phone, style: TextStyle(fontSize: 24),),
        )


      ],
    );
  }
}
