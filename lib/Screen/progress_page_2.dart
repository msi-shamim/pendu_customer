import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/progress_page_3.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/Screen/screen_progress.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

class IconMenu {
  final String svgPath;
  final String titleIcon;
  IconMenu({this.svgPath, this.titleIcon});
}

List<IconMenu> iconList = [
  IconMenu(svgPath: 'assets/asap.svg', titleIcon: 'ASAP'),
  IconMenu(svgPath: 'assets/4 hours.svg', titleIcon: '4Hrs'),
  IconMenu(svgPath: 'assets/6 hours.svg', titleIcon: '6Hrs'),
  IconMenu(svgPath: 'assets/sameday.svg', titleIcon: 'Same day'),
  IconMenu(svgPath: 'assets/next day.svg', titleIcon: 'Next day'),
  IconMenu(svgPath: 'assets/set later.svg', titleIcon: 'Set later'),
];

class ProgressPage2 extends StatefulWidget {
  @override
  _ProgressPage2State createState() => _ProgressPage2State();
}

class _ProgressPage2State extends State<ProgressPage2> {
  int selectedIndex = -1;
  Widget _deliveryContainer() {
    return Container(
      height: 340,
      // color: Colors.blue,
      child: GridView.builder(
        itemCount: iconList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () => setState(() => selectedIndex = position),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: BorderRadius.circular(5.0),
                color:
                    (selectedIndex == position) ? Pendu.color('EEFEF5') : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    iconList[position].svgPath,
                    color: Pendu.color('90A0B2'),
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    width: 65,
                    child: Text(
                      iconList[position].titleIcon,
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).accentColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Shop & Drop'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //   Timeline(),
              ScreenProgress(screenValue: 2),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeader(text: 'Delivery Time'),
              _deliveryContainer(),
              BottomWarringText(
                  textColor: Pendu.color('FFB44A'),
                  borderColor: Pendu.color('E8E8E8'),
                  text:
                      'You can also sort out the delivery times with your dropper directly, You wonn\'t be charged until you accept an offer'),
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButtonCustom(),
                  ProgressButton(
                    btnText: 'Review',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProgressPage3()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
