import 'package:barber/BarberList.dart';
import 'package:barber/SearchResult.dart';
import 'json/response.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SearchResults extends StatefulWidget {
  final String query;

  @override
  _SearchResultsState createState() => _SearchResultsState();
  SearchResults({Key key, this.query}) : super(key: key);
}

class _SearchResultsState extends State<SearchResults> {
  BaseResponse _barberList = new BaseResponse(new List<Barber>());

  @override
  void initState() {
    super.didChangeDependencies();
    super.initState();
    _setBarbersList();
  }

  _setBarbersList() async {
    var jsonString =
        await rootBundle.loadString('assets/JSON/barbers_list.json');
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
        title: Text(
          "Barber",
          style: TextStyle(
              fontFamily: 'Alvaro-Condensed', fontSize: 36, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: _barberList.barbers.length,
        itemExtent: 80,
        itemBuilder: (context, i) {
          return _buildRow(_barberList.barbers[i]);
        },
      ),
    );
  }

  Widget _buildRow(Barber barber) {
    return new ListTile(
      title: new Text(barber.name),
      subtitle: new Text(barber.address),
      leading: CircleAvatar(
        child: Image.asset(
          "assets/icons/" + barber.icon,
        ),
        radius: 35,
        backgroundColor: Colors.black12,
      ),
      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResult(barber: barber)));},
    );
  }
}
