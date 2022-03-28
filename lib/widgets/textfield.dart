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
      child: TextField(
        decoration: InputDecoration(
          labelText: _textFieldLabel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        // onChanged: ,
      ),
    );
  }
}
