import 'package:barber/Models/Font.dart';
import 'package:flutter/material.dart';

class AddBarber extends StatefulWidget {
  AddBarber({Key key}) : super(key: key);

  _AddBarberState createState() => _AddBarberState();
}

class _AddBarberState extends State<AddBarber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _getAppBar(),
          body: _getBody());
      }
    
      Widget _getBody() {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(decoration: InputDecoration(hintText: 'eg. SB Barber Academy',labelText: 'Name'),),
                  TextFormField(decoration: InputDecoration(hintText: 'eg. SR5 2AS',labelText: 'Address'),),
                  TextFormField(decoration: InputDecoration(hintText: 'eg. +44 7730 192348',labelText: 'Phone Number'),),
                ],
              ),
            ),
          ),
        );
      }
    
      Widget _getAppBar() {
            return AppBar(
      centerTitle: true,
      title: Text('Add barber', style: Font.appBarTextStyle),
    );
      }
}
