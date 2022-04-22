import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      bool isObscure = false,
      required TextEditingController controller,
      required String txtLabel})
      : _controller = controller,
        _txtLabel = txtLabel,
        _isObscure = isObscure,
        super(key: key);

  final TextEditingController _controller;
  final String _txtLabel;
  bool _isObscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      decoration:
          InputDecoration(label: Text(_txtLabel), border: OutlineInputBorder()),
      controller: _controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ("$_txtLabel cannot be empty");
        }
        return null;
      },
    );
  }
}
