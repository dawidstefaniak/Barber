import 'package:barber/Models/Font.dart';
import 'package:flutter/material.dart';

class SearchResultObjects extends Object{
    static Widget getTopLabel(String text){
      return Padding(
        padding: const EdgeInsets.only(left: 24, top: 16, bottom: 8),
        child: Text(text, style:TextStyle(fontFamily: Font.secondFont, fontSize: 24),),
      );
    }
}