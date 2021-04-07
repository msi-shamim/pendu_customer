import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/screen_progress.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/container_progress_page_2.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';

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
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ScreenProgress(ticks: 2),
              SizedBox(
                height: 20,
              ),
              Text(
                'Delivery Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                // padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Pendu.color('EE82EE'), width: 2.0),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper',
                  style: TextStyle(color: Colors.red[400], fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
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
