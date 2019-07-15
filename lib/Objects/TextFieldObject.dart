import 'package:barber/Models/Font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldObject extends Object {
  static Widget getTextField(
      {String hintText, String labelText, TextEditingController controller, TextInputType inputType}) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      textInputAction: TextInputAction.go,
      keyboardType: inputType ?? TextInputType.text,
      style: TextStyle(
          color: Color(0xff685408), fontFamily: Font.secondFont, letterSpacing: 2.5),
      decoration: InputDecoration(
          hintText: hintText ?? '',
          labelText: labelText ?? '',
          labelStyle: TextStyle(fontSize: 18, color: Color(0xff685408)),
          hintStyle: TextStyle(color: Color(0xff685408), letterSpacing: 1),
          border: _textBorder(),
          enabledBorder: _textBorder(),
          focusedBorder: _textBorder(),

          ),
    );
  }

  static _textBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xff685408)));
  }
}
