import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final String textLabel;
  final Function validator;
  final String hintText;
  final TextEditingController controller;
  PasswordTextFormField(
      {this.textLabel, this.validator, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: true,
        validator: validator,
        decoration: InputDecoration(
          // labelStyle: TextStyle(color: Colors.black, fontSize: 14),
          labelText: textLabel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ));
  }
}
