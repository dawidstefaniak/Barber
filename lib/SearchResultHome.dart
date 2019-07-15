import 'package:barber/Models/Font.dart';
import 'package:barber/json/response.dart';
import 'package:flutter/material.dart';

class SearchResultHome extends StatefulWidget {
  final Barber barber;
  _SearchResultHomeState createState() => _SearchResultHomeState();

  SearchResultHome({Key key, this.barber}) : super(key: key);
}

class _SearchResultHomeState extends State<SearchResultHome> {
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
    return ListView(
      children: <Widget>[
        Container(
          height: 245,
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/barber2.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      color: Color(0xfffffec4),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset(0.5, 1),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 2),
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile1.jpg"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
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
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Opening times',
                      style:
                          TextStyle(fontFamily: Font.secondFont, fontSize: 32),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: <Widget>[
                      GridView.count(
                        crossAxisCount: 2,
                        primary: false,
                        childAspectRatio: 6,
                        mainAxisSpacing: 1,
                        shrinkWrap: true,
                        children: _dayOfTheWeekRows(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _dayOfTheWeekRows() {
    List<Widget> widgets = new List<Widget>();
    for (var x = 0; x < 7; x++) {
      var opening = 0;
      if (x > 4) opening = 1;

      widgets.add(
        Text(
          _daysOfWeek[x] + '  :',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 24),
        ),
      );
      widgets.add(Text(
        "  " + _openingTimes[opening],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ));
    }
    return widgets;
  }
}
