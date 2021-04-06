import 'package:flutter/material.dart';

class NormalTextFormField extends StatelessWidget {
  @override
  final Function onChanged;
  final String labelText;
  final Function validator;
  final String hintText;

  NormalTextFormField(
      {this.onChanged, this.labelText, this.validator, this.hintText});
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: hintText,
          // hintStyle: hintTextStyle(),
        ));
  }
}
