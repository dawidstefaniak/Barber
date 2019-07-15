import 'package:barber/Models/Font.dart';
import 'package:barber/json/response.dart';
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

  bool _isButtonEnabled;

  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();

    _isButtonEnabled = false;

    // Init controllers
    _nameController = new TextEditingController();
    _addressController = new TextEditingController();
    _phoneController = new TextEditingController();

    // Init listeners
    _nameController.addListener(_textEditingListener);
    _addressController.addListener(_textEditingListener);
    _phoneController.addListener(_textEditingListener);
  }

  void _textEditingListener() {
    if (_nameController.text != '' &&
        _addressController.text != '' &&
        _phoneController.text != '')
      _isButtonEnabled = true;
    else
      _isButtonEnabled = false;
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldObject.getTextField(
                  hintText: 'eg. SB Barber Academy',
                  labelText: 'Name',
                  controller: _nameController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldObject.getTextField(
                  hintText: 'eg. SR5 2AS',
                  labelText: 'Address',
                  controller: _addressController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldObject.getTextField(
                  hintText: 'eg. +44 7730 192348',
                  labelText: 'Phone Number',
                  controller: _phoneController,
                  inputType: TextInputType.phone),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
              _isButtonEnabled ?
                BoxShadow(
                    offset: Offset(3, 3),
                    color: Colors.yellow.withOpacity(0.4),
                    blurRadius: 5)
               : BoxShadow(
                    offset: Offset(3, 3),
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5)
              ], border: Border.all(style: BorderStyle.none)),
              
              
              width: MediaQuery.of(context).size.width * 0.25,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: Font.secondFont,
                        letterSpacing: 2),
                  ),
                  color: Colors.yellow,
                  splashColor: Colors.white,
                  disabledColor: Colors.grey[300],
                  onPressed: _isButtonEnabled ? _addBarber : null,
                ),
              ),
            ),
          ],
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
      Barber barber = new Barber(
          _nameController.text,
          _addressController.text,
          "scissors.png",
          _phoneController.text,
          ["barber1.jpg", "barber2.jpg"]);
      Firestore.instance
          .collection('barbers')
          //TODO use Barber object instead
          .add(barber.toJson())
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
