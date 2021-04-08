import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/Screen/screen_progress.dart';
import 'package:pendu_customer/Screen/timline_tile.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/container_progress_page_2.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

class ProgressPage2 extends StatelessWidget {
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
              Row(
                children: [
                  ContainerProgressPage2(
                    svgPath: 'assets/clip.svg',
                    text: 'ASAP',
                  ),
                  SizedBox(width: 10),
                  ContainerProgressPage2(
                    svgPath: 'assets/clip.svg',
                    text: 'ASAP',
                  ),
                ],
              ),
              Row(
                children: [
                  ContainerProgressPage2(
                    svgPath: 'assets/clip.svg',
                    text: 'ASAP',
                  ),
                  SizedBox(width: 10),
                  ContainerProgressPage2(
                    svgPath: 'assets/clip.svg',
                    text: 'ASAP',
                  ),
                ],
              ),
              Row(
                children: [
                  ContainerProgressPage2(
                    svgPath: 'assets/clip.svg',
                    text: 'ASAP',
                  ),
                  SizedBox(width: 10),
                  ContainerProgressPage2(
                    svgPath: 'assets/clip.svg',
                    text: 'ASAP',
                  ),
                ],
              ),
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
}
