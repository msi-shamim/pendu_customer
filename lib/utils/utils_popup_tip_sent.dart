import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class TipSentPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Tip sent',
                style: TextStyle(fontSize: 16),
              ),
              Divider(
                height: 10,
                thickness: 2,
                indent: 10.0,
                endIndent: 10.0,
              ),
              SizedBox(height: 20.0),
              Text('Congratulation!',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  )),
              Text('You have sent the Tip successfully')
            ],
          ),
        ));
  }
}
