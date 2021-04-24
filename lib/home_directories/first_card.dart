import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/screen_movers/movers_1.dart';
import 'package:pendu_customer/Screen/progress_page_1.dart';
import 'package:pendu_customer/Screen/progress_page_2.dart';
import 'package:pendu_customer/Screen/progress_page_3.dart';
import 'package:pendu_customer/screen_coleect_and_deliver/collect_drop_page_1.dart';
import 'package:pendu_customer/utils/icon_title.dart';

class FirstCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  'What you’d like to get delivered?',
                  style: TextStyle(fontSize: 18),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProgressPage1()),
                        );
                      },
                      child: HomePageIcon(
                          iconpath: 'assets/shop_drop.svg',
                          title: 'Shop & Drop')),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CollectDropPage1()),
                        );
                      },
                      child: HomePageIcon(
                          iconpath: 'assets/collect _ drop.svg',
                          title: 'Collect & Deliver')),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoversPage1()),
                        );
                      },
                      child: HomePageIcon(
                          iconpath: 'assets/movers.svg', title: 'Movers')),
                ],
              ),
            )
          ],
        ),
      );
}
