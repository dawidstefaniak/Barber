import 'package:barber/Models/Font.dart';
import 'package:barber/Objects/DefaultButton.dart';
import 'package:barber/json/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                controller: _addressController,
              ),
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
            DefaultButton(
              isButtonEnabled: _isButtonEnabled,
              onPressed: _addBarber,
              text: 'Add',
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
