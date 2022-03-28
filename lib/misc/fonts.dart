import 'package:flutter/material.dart';
import 'package:rentverse1/misc/colors.dart';

class titleHugeFont extends StatelessWidget {
  final double _size;
  final String _text;
  final Color _color;

  titleHugeFont(this._size, this._text, this._color);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontFamily: 'Bungee', fontSize: _size, color: _color),
    );
  }
}
