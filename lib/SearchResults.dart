import 'package:barber/BarberList.dart';
import 'json/response.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SearchResults extends StatefulWidget{
  final String query;

  @override
  _SearchResultsState createState() => _SearchResultsState();
  SearchResults({Key key, this.query}) : super(key: key);

}

class _SearchResultsState extends State<SearchResults>{

  BaseResponse _barberList = new BaseResponse(new List<Barber>());

  @override
  void initState() {
    super.didChangeDependencies();
    super.initState();
    _setBarbersList();
  }

  _setBarbersList() async {
    var jsonString = await rootBundle.loadString('assets/JSON/barbers_list.json');
    var parsed = json.decode(jsonString);
    setState(() {
      _barberList = BaseResponse.fromJson(parsed);
    });
    print(_barberList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.query),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList (){
    return ListView.builder(
      itemCount: _barberList.barbers.length,
      itemBuilder: (context, i) {
        return _buildRow(_barberList.barbers[i].name);
      },
    );
  }


  Widget _buildRow(String result){
    return new ListTile(
      title: new Text(result),

    );
  }
}