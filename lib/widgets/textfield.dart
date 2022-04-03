import 'package:flutter/material.dart';
import 'package:rentverse1/misc/colors.dart';

class textField extends StatelessWidget {
  final String _textFieldLabel;
  final double _width;

  textField(this._textFieldLabel, this._width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: 40,
      child: Container(
        height: 40,
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              focusColor: colorScheme.activeStateMain,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7.0))),
        ),
      ),
    );
  }
}
