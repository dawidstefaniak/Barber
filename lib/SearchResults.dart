import 'package:barber/BarberList.dart';
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

  var _results = [];

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
      itemBuilder: (context, i){
        if (_results == [])
          setState(() async {
            _results = await setList();
          });
        if (i.isOdd)
          return Divider();

        final index = i ~/ 2;
        if (index >= _results.length)
          {
            _results = _results + _results;
          }
        return _buildRow(_results[index]);
      },
    );
  }

  Future<List<Barber>> setList() async{
    var jsonString = await rootBundle.loadString('assets/JSON/barbers_list.json');
    var parsed = json.decode(jsonString).cast<Map<String,dynamic>>();
    return parsed.map<Barber>((json) => Barber.fromJson(json)).toList();
  }

  Widget _buildRow(String result){
    return new ListTile(
      title: new Text(result)
    );
  }

}