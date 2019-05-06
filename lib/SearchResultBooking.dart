import 'package:barber/Models/Font.dart';
import 'package:barber/json/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';


class SearchResultBooking extends StatefulWidget{
  final Barber barber;
  _SearchResultBookingState createState() => _SearchResultBookingState();

  SearchResultBooking({Key key, this.barber}) : super(key: key);

}

class _SearchResultBookingState extends State<SearchResultBooking>{


  @override
  Widget build(BuildContext context) {

    return Container(
      child: CalendarCarousel(
        firstDayOfWeek: 0,
        selectedDayButtonColor: Color(0xff685408),
        todayButtonColor: Colors.black54,
        iconColor: Colors.black54,
        headerTextStyle: TextStyle(color: Colors.black87, fontSize: 22),
        //onDayPressed: (DateTime date, List<Event> events){}
    )
    );

  }

}


