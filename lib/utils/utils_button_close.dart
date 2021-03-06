import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class CloseButtonUtils extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      width: MediaQuery.of(context).size.width / 2 - 50,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('FFB44A'), width: 2.0),
          borderRadius: BorderRadius.circular(5.0)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white),
        onPressed: () {},
        child: Text(
          'Close',
          style: TextStyle(
              color: Pendu.color('FFB44A'),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
