import 'package:flutter/material.dart';
import 'package:rentverse1/misc/colors.dart';

class textField extends StatelessWidget {
  final String _textFieldLabel;
  final double _width;
  final TextEditingController _controller;
  final String _label;
  bool _isEnabled = false;
  textField(this._textFieldLabel, this._width, this._controller,
      this._isEnabled, this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: 40,
      child: Container(
        height: 40,
        child: TextField(
          //textinputaction
          controller: _controller,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              iconColor: colorScheme.activeStateMain,
              prefixIcon: Icon(Icons.person),
              focusColor: colorScheme.activeStateMain,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: colorScheme.purpleMuch,
              ))),
        ),
      ),
    );
  }
}
