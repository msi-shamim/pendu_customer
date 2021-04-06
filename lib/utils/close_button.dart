import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class CloseButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      width: MediaQuery.of(context).size.width / 2 - 50,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red[400], width: 2.0),
          borderRadius: BorderRadius.circular(5.0)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white),
        onPressed: () {},
        child: Text(
          'Close',
          style: TextStyle(
              color: Colors.red[400],
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
