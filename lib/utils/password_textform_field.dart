import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  @override
  final Function onChanged;
  final String labelText;
  final Function validator;
  final String hintText;

  PasswordTextFormField(
      {this.onChanged, this.labelText, this.validator, this.hintText});
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        obscureText: true,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: hintText,
          //hintStyle: hintTextStyle(),
        ));
  }
}
