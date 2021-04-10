import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/Screen/screen_progress.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

class IconMenu {
  final IconData iconName;
  final String titleIcon;
  IconMenu({this.iconName, this.titleIcon});
}

List<IconMenu> iconList = [
  IconMenu(iconName: Icons.ac_unit, titleIcon: "ASAP"),
  IconMenu(iconName: Icons.access_alarm, titleIcon: "4Hrs"),
  IconMenu(iconName: Icons.accessibility_new, titleIcon: "6Hrs"),
  IconMenu(iconName: Icons.add, titleIcon: "Same day"),
  IconMenu(iconName: Icons.account_balance, titleIcon: "Next day"),
  IconMenu(iconName: Icons.access_time_sharp, titleIcon: "Set later"),
];

class ProgressPage2 extends StatefulWidget {
  @override
  _ProgressPage2State createState() => _ProgressPage2State();
}

class _ProgressPage2State extends State<ProgressPage2> {
  int selectedIndex = -1;
  Widget _deliveryContainer() {
    return Container(
      height: 300,
      // color: Colors.blue,
      child: GridView.builder(
        itemCount: iconList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () => setState(() => selectedIndex = position),
            child: Card(
              color: (selectedIndex == position) ? Colors.green : null,
              child: Row(
                children: [
                  // SvgPicture.asset(
                  //   svgPath,
                  //   color: Pendu.color('EE82EE'),
                  //   width: 50,
                  //   height: 50,
                  // ),
                  Text(
                    iconList[position].titleIcon,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Pendu.color('5BDB98'),
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
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   Timeline(),
              ScreenProgress(ticks: 2),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeader(text: 'Delivery Time'),
              _deliveryContainer(),
              SizedBox(
                height: 5,
              ),
              BottomWarringText(
                  text:
                      'You can also sort out the delivery times with your dropper directly, You wonn\'t be charged until you accept an offer'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButtonCustom(),
                  ProgressButton(
                    btnText: 'Review',
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerProgressPage2({String svgPath, String text}) {
    return new Container(
      width: 160,
      height: 110,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('5BDB98'), width: 2.0),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            color: Pendu.color('EE82EE'),
            width: 50,
            height: 50,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Pendu.color('5BDB98'),
            ),
          )
        ],
      ),
    );
  }
}
