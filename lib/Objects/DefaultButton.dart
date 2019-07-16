import 'package:barber/Models/Font.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key key,
      @required bool isButtonEnabled,
      String text,
      var onPressed,
      Color backgroundColor,
      Color splashColor,
      Color disabledColor,
      Color textColor,
      Border border})
      : _isButtonEnabled = isButtonEnabled,
        _text = text ?? '',
        _onPressed = onPressed ?? null,
        _backgroundColor = backgroundColor ?? Colors.yellow,
        _splashColor = splashColor ?? Colors.white,
        _disabledColor = disabledColor ?? Colors.grey[300],
        _border = border,
        _textColor = textColor,
        super(key: key);

  final bool _isButtonEnabled;
  final String _text;
  final _onPressed;
  final Color _backgroundColor;
  final Color _splashColor;
  final Color _disabledColor;
  final Border _border;
  final Color _textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              _isButtonEnabled
                  ? BoxShadow(
                      offset: Offset(3, 3),
                      color: _backgroundColor.withOpacity(0.4),
                      blurRadius: 5)
                  : BoxShadow(
                      offset: Offset(3, 3),
                      color: _disabledColor.withOpacity(0.4),
                      blurRadius: 5)
            ],
            border: _border ?? Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.25,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            child: Text(
              _text,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: Font.secondFont,
                  letterSpacing: 0,
                  color: _textColor ?? Colors.black),
            ),
            color: _backgroundColor,
            splashColor: _splashColor,
            disabledColor: _disabledColor ?? Colors.grey[300],
            onPressed: _isButtonEnabled ? _onPressed : null,
          ),
        ));
  }
}
