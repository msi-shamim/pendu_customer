import 'package:flutter/material.dart';

class TextFormFieldNormalUtils extends StatelessWidget {
  final String textLabel;
  final Function validator;
  final String hintText;
  final TextEditingController controller;
  final bool isPhonekey;

  TextFormFieldNormalUtils(
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
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ));
  }
}
