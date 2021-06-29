import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowSnackBar{
  final BuildContext context;
  final String text;
  ShowSnackBar(this.context, this.text);

  show(){
    var snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}