import 'package:barber/Models/Font.dart';
import 'package:barber/Objects/SearchResultObjects.dart';
import 'package:barber/BarberFromFirebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class SearchResultBooking extends StatefulWidget {
  final Barber barber;
  _SearchResultBookingState createState() => _SearchResultBookingState();

  SearchResultBooking({Key key, this.barber}) : super(key: key);
}

class _SearchResultBookingState extends State<SearchResultBooking> {
  var _selectedDateTime = new DateTime.now();
  var _markedDatesMap = new EventList<DateTime>();

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SearchResultObjects.getTopLabel("Booking"),
      Divider(),
      CalendarCarousel(
        height: 600,
        firstDayOfWeek: int.fromEnvironment("Mon"),
        selectedDayButtonColor: Colors.black26,
        todayButtonColor: Colors.black54,
        iconColor: Colors.black54,
        dayButtonColor: Colors.transparent,
        selectedDateTime: _selectedDateTime,
        onDayPressed: (DateTime datetime, List<dynamic> dynamic) {
          setState(() {
            _selectedDateTime = datetime;
            _markedDatesMap.add(_selectedDateTime, null);
          });
        },
        markedDatesMap: _markedDatesMap,
        headerTextStyle: TextStyle(color: Colors.black87, fontSize: 22),
      ),
    ]);
  }
}
