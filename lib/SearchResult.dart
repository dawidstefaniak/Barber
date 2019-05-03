import 'package:barber/Models/Font.dart';
import 'package:barber/json/response.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final Barber barber;

  _SearchResultState createState() => _SearchResultState();

  SearchResult({Key key, this.barber}) : super(key: key);
}

class _SearchResultState extends State<SearchResult> {
  var _daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  var _openingTimes = ['9:00-17:00', 'Closed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.barber.name, style: Font.appBarTextStyle),
      ),
      body: ListView(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            child: Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Image.asset(
                    'assets/images/barber2.jpg',
                    fit: BoxFit.fill,
                  )),
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.6,
                      child: Container(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.barber.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: Font.secondFont,
                            fontSize: 42,
                            color: Color(0xfffffec4)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 24),
              child: Container(
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      fontFamily: Font.mainFont,
                      fontSize: 24,
                      color: Color(0xff685408)),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Container(
              child: Text(
                widget.barber.name,
                style: TextStyle(
                    fontFamily: Font.mainFont,
                    fontSize: 36,
                    color: Color(0xff685408)),
              ),
              alignment: Alignment.topCenter,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GridView.count(crossAxisCount: 2,primary: false, childAspectRatio: 10, mainAxisSpacing: 1, shrinkWrap: true, children: _dayOfTheWeekRows()),
          ),
        ],
      ),
    );
  }

  _dayOfTheWeekRows() {
    List<Widget> widgets = new List<Widget>();
    for (var x = 0; x < 7; x++) {
      var opening = 0;
      if (x > 4) opening = 1;

      widgets.add(
        Text(_daysOfWeek[x] + '  :', textAlign: TextAlign.right,),
      );
      widgets.add(Text(
        "  " + _openingTimes[opening],
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
    }
    return widgets;
  }
}
