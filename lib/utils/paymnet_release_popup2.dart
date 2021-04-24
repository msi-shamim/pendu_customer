import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/screen_common/request_status.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

List<String> _moneyList = ['5', '10', '15', '20'];

class PaymentRelesedPopUp2 extends StatefulWidget {
  @override
  _PaymentRelesedPopUp2State createState() => _PaymentRelesedPopUp2State();
}

class _PaymentRelesedPopUp2State extends State<PaymentRelesedPopUp2> {
  int selectedIndex = -1;

  _tipListCard() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _moneyList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 0),
      itemBuilder: (context, position) {
        return InkWell(
          onTap: () => setState(() => selectedIndex = position),
          child: Container(
            decoration: BoxDecoration(
                color:
                    (selectedIndex == position) ? Pendu.color('FFEBCF') : null,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: (selectedIndex == position)
                        ? Pendu.color('FFEBCF')
                        : Pendu.color('90A0B2'))),
            child: Center(
              child: Text(
                '\$' + _moneyList[position],
                style: TextStyle(color: Pendu.color('FFB44A'), fontSize: 16.0),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(top: _height / 1.7),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Todo Header line
            Center(child: Text('Review sent successfully')),
            Divider(height: 20, thickness: 2, indent: 0, endIndent: 0),
            //Todo Tip header text
            Text('Want to give a tip!'),
            SizedBox(height: 10),
            //Todo card list
            _tipListCard(),
            SizedBox(height: 10),
            //Todo Button
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestStatus()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Pendu.color('E7F8EF')),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    )),
              ),
            ),

            Divider(height: 20, thickness: 2, indent: 0, endIndent: 0),
            //Todo Row Refer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/refer a friend.svg',
                  height: 25,
                  width: 25,
                  color: Pendu.color('3CD9E5'),
                ),
                SizedBox(width: 10),
                Text(
                  'Refer and earn',
                  style: TextStyle(fontSize: 12.0),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_right_alt),
              ],
            ),
            SizedBox(height: 10),
            //TOdo Refer Text
            Center(child: Text('You could arn \$15 on a successful refer')),
          ],
        ),
      ),
    );
  }
}
