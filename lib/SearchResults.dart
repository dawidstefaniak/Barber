import 'package:barber/SearchResult.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Models/Font.dart';
import 'package:barber/BarberFromFirebase.dart' as FirebaseBarber;

import 'json/response.dart';
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

  Widget _buildFirestoreList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((data) => _buildFirebaseListItem(context, data))
          .toList(),
    );
  }

  Widget _buildFirebaseListItem(BuildContext context, DocumentSnapshot data) {
    final record = FirebaseBarber.Barber.fromSnapshot(data);

   return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(record.name),
         trailing: Text(record.address),
         onTap: () => print(record),
       ),
     ),
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchResult(barber: barber)));
      },
    );
  }
}
