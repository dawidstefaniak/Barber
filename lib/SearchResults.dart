import 'package:barber/AddBarber.dart';
import 'package:barber/SearchResult.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Models/Font.dart';
import 'package:barber/BarberFromFirebase.dart' as FirebaseBarber;

import 'json/response.dart' as Barber;
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
        title: Text("Barber", style: Font.appBarTextStyle),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _onPressedAdd,
          )
        ],
      ),
      //body: _buildList(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('barbers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return _buildFirestoreList(context, snapshot.data.documents);
        });
  }

  Widget _buildFirestoreList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
          itemExtent: 80,
          children: snapshot
              .map((data) => _buildFirebaseListItem(context, data))
              .toList()),
    );
  }

  Widget _buildFirebaseListItem(BuildContext context, DocumentSnapshot data) {
    final record = Barber.Barber.fromJson(data.data);

    return new ListTile(
      title: new Text(record.name),
      subtitle: new Text(record.address),
      leading: CircleAvatar(
        child: Image.asset(
          "assets/icons/" + record.icon,
        ),
        radius: 35,
        backgroundColor: Colors.black12,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResult(barber: record),
          ),
        );
      },
    );
  }

  void _onPressedAdd() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => AddBarber(),) 
      );
  }
}
