import 'package:barber/json/response.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget{
  final Barber barber;

  _SearchResultState createState() => _SearchResultState();

  SearchResult({Key key, this.barber}) : super(key: key);
}

class _SearchResultState extends State<SearchResult>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.barber.name),
      ),
    );
  }

}