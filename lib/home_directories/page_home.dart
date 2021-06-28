import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/progress_page_1.dart';
import 'package:pendu_customer/home_directories/breadcramp.dart';
import 'package:pendu_customer/home_directories/driver_card.dart';
import 'package:pendu_customer/home_directories/image_carousel.dart';
import 'package:pendu_customer/home_directories/recent_drops.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/models/response_pro_driver_model.dart';
import 'package:pendu_customer/profile_screen/pro_driver.dart';
import 'package:pendu_customer/profile_screen/profile.dart';
import 'package:pendu_customer/profile_screen/profile_notification.dart';
import 'package:pendu_customer/screen_coleect_and_deliver/collect_drop_page_1.dart';
import 'package:pendu_customer/screen_movers/movers_1.dart';
import 'package:pendu_customer/utils/icon_title.dart';
import 'package:pendu_customer/utils/nav_bar.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';
import 'package:pendu_customer/utils/snackBar_page.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';

import 'announcement_container.dart';
import 'box_section.dart';
import 'our_blog.dart';

class HomePage extends StatefulWidget {
  final User user;
  final String token;

  HomePage({this.user, this.token});

  @override
  State<StatefulWidget> createState() {
    return _HomeState(user, token);
  }
}

final List<String> _imageItems = [
  'assets/banner_01.png',
  'assets/banner_02.png',
];

class _HomeState extends State<HomePage> {
  final User user;
  final String token;

  _HomeState(this.user, this.token);

  List<ProDriverList> _proDriverList = [];

  @override
  void initState() {
    if (token != null) {
      _proDriverList = FetchDataUtils(context).getProDrivers(token);
    } else {
      SnackBarClass.snackBarMethod(
          message: "Something went wrong", context: context);
    }
    super.initState();
  }

  Widget _buildFirstCard() {
    return Card(
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
                            builder: (context) => ProgressPage1(
                                  user: user,
                                  token: token,
                                )),
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
                        MaterialPageRoute(builder: (context) => MoversPage1()),
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

  Future buildText() {
    return Future.delayed(Duration(seconds: 1), () => print('waiting...'));
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(72),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          color: Theme.of(context).accentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 4),
          child: AppBar(
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
            title: Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 12, top: 0, bottom: 0),
                  child: Image.asset('assets/logo.png',
                      height: 32,
                      width: 32,
                      color: Theme.of(context).accentColor),
                ),
                Text(
                  'pendu',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 24),
                )
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileNotification()));
                },
                child: SvgPicture.asset(
                  'assets/notification.svg',
                  height: 32,
                  width: 32,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfile(
                                user: user,
                                token: token,
                              )));
                },
                child: SvgPicture.asset(
                  'assets/profile app.svg',
                  height: 32,
                  width: 32,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _widthHight = MediaQuery.of(context).size.width / 2 - 50;
    return Scaffold(
      bottomNavigationBar:
          BottomNavigation(initValue: 0, user: user, token: token),
      appBar: _buildAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          //section 01
          _buildFirstCard(),
          //section 02
          ImageCarousel(_imageItems),
          //section 03
          Column(
            children: [
              Breadcamp('Pro Drivers in Your Area', ProDriver()),
              Container(
                  height: 280,
                  child: FutureBuilder(
                    future: buildText(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          _proDriverList != null) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _proDriverList.length,
                          itemBuilder: (BuildContext context, int i) =>
                              DriverCard(_proDriverList[i]),
                          separatorBuilder: (BuildContext context, int i2) =>
                              Divider(),
                        );
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Theme.of(context).accentColor,
                        ));
                      }
                    },
                  ))
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

          ProgressPageHeader(text: 'Recent Drops Around You'),
          RecentDrops(),
          //todo Announcement
          ProgressPageHeader(text: 'Announcement'),
          Announcement(),

          //Todo four card
          BoxSection(
            widthData: _widthHight,
          ),
          //Todo Blog post
          ProgressPageHeader(text: 'Our Blog'),
          OurBlog(token),
        ],
      ),
    );
  }
}
