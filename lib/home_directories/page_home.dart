import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/home_directories/breadcramp.dart';
import 'package:pendu_customer/home_directories/driver_card.dart';
import 'package:pendu_customer/home_directories/first_card.dart';
import 'package:pendu_customer/home_directories/image_carousel.dart';
import 'package:pendu_customer/home_directories/recent_drops.dart';
import 'package:pendu_customer/utils/PenduAppBar.dart';
import 'package:pendu_customer/utils/icon_title.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'announcement_container.dart';
import 'box_section.dart';
import 'our_blog.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

final List<String> _imageItems = [
  'assets/banner_01.png',
  'assets/banner_02.png',
];

final List<String> _drivers = [
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
];

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: PenduAppBar(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          //section 01
          FirstCard(),
          //section 02
          ImageCarousel(_imageItems),
          //section 03
          Column(
            children: [
              Breadcamp('Pro Drivers in Your Area', null),
              Container(
                height: 280,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _drivers.length,
                  itemBuilder: (BuildContext context, int i) =>
                      DriverCard(_drivers[i]),
                  separatorBuilder: (BuildContext context, int i2) => Divider(),
                ),
              )
            ],
          ),
          //section 04
          Card(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Breadcamp('How it Works', null),
                Image.asset('assets/how_it_works.png')
              ],
            ),
          ),
          SizedBox(height: 10),
          //Todo Rexent drops card slide
          ProgressPageHeader(text: 'Recent Drops Around You'),
          RecentDrops(),
          //todo Announcement
          ProgressPageHeader(text: 'Announcement'),
          Announcement(),

          //Todo four card
          Expanded(child: BoxSection()),
          //Todo Blog post
          ProgressPageHeader(text: 'Our Blog'),
          Expanded(child: OurBlog()),
        ],
      ),
    );
  }
}
