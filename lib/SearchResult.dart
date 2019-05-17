import 'package:barber/Models/Font.dart';
import 'package:barber/SearchResultBooking.dart';
import 'package:barber/SearchResultContact.dart';
import 'package:barber/SearchResultHome.dart';
import 'package:barber/SearchResultPictures.dart';
import 'package:barber/json/response.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final Barber barber;

  _SearchResultState createState() => _SearchResultState();

  SearchResult({Key key, this.barber}) : super(key: key);
}

class _SearchResultState extends State<SearchResult> {

  var _selectedIndex = 0;

  Widget getChild(int index){
    if (index == 0){
      return SearchResultHome(barber: widget.barber);
    }
    if (index == 1){
      return SearchResultPictures(barber: widget.barber,);
    }
    if (index == 2){
      return SearchResultBooking(barber: widget.barber,);
    }
    if (index == 3){
      return SearchResultContact(barber: widget.barber,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      bottomNavigationBar: _getBottomNavigationBar(),
      body: getChild(_selectedIndex)
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
              color: Colors.black54,
            ),
            title: Text("Picture")),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black54,
            ),
            title: Text("Book")),

        BottomNavigationBarItem(
            icon: Icon(
              Icons.contacts,
              color: Colors.black54,
            ),
            title: Text("Contact")),
      ],
      currentIndex: _selectedIndex,
      onTap: _onBottomNavigationItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }

  _onBottomNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(widget.barber.name, style: Font.appBarTextStyle),
    );
  }
}
