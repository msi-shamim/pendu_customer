import 'package:flutter/material.dart';

class NormalTextFormField extends StatelessWidget {
  final String textLabel;
  final Function validator;
  final String hintText;
  final TextEditingController controller;
  final bool isPhonekey;

  NormalTextFormField(
      {this.textLabel,
      this.validator,
      this.hintText,
      this.controller,
      this.isPhonekey});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: (isPhonekey) ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          labelText: textLabel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: hintText,
        ));
  }
}
