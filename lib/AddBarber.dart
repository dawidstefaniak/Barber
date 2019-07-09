import 'package:barber/Models/Font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Objects/TextFieldObject.dart';

class AddBarber extends StatefulWidget {
  AddBarber({Key key}) : super(key: key);

  _AddBarberState createState() => _AddBarberState();
}

class _AddBarberState extends State<AddBarber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController();
    _addressController = new TextEditingController();
    _phoneController = new TextEditingController();
  }

  Widget _getBody() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFieldObject.getTextField(
                  hintText: 'eg. SB Barber Academy',
                  labelText: 'Name',
                  controller: _nameController),
              TextFieldObject.getTextField(
                  hintText: 'eg. SR5 2AS',
                  labelText: 'Address',
                  controller: _addressController),
              TextFieldObject.getTextField(
                  hintText: 'eg. +44 7730 192348',
                  labelText: 'Phone Number',
                  controller: _phoneController),
              RaisedButton(
                child: Text('Add'),
                onPressed: _addBarber,
              )
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

  void _addBarber() {
    if (_phoneController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty) {
      Firestore.instance
          .collection('barbers')
          //TODO use Barber object instead
          .add({
            "address": _addressController.text,
            "icon": "scissors.png",
            "images": ["barber1.jpg", "barber2.jpg"],
            "name": _nameController.text,
            "phone": _phoneController.text
          })
          .then((result) => {
                Navigator.pop(context),
                _nameController.clear(),
                _phoneController.clear(),
                _addressController.clear()
              })
          .catchError((error) => print(error));
    }
  }
}
