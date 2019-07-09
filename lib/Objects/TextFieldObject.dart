import 'package:flutter/material.dart';

class TextFieldObject extends Object{
  static Widget getTextField({String hintText, String labelText, TextEditingController controller}) {
    return TextField(
      decoration: InputDecoration(hintText: hintText??'', labelText: hintText??'',),
      controller: controller,
    );
  }
}