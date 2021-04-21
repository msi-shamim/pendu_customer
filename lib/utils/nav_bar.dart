import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:pendu_customer/Screen/received_offers.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/profile_screen/profile.dart';
import 'package:pendu_customer/profile_screen/task_view.dart';
import 'package:pendu_customer/utils/pendu_icon.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class BottomNavigation extends StatefulWidget {
  final String initValue;
  BottomNavigation({this.initValue});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        MotionTabController(initialIndex: 0, vsync: this, length: 4);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      labels: ["Home", "Tasks", "Offers", "My profile"],
      initialSelectedTab: widget.initValue,
      tabIconColor: Colors.black,
      tabSelectedColor: Pendu.color('60E99C'),
      onTabItemSelected: (int value) {
        setState(() {
          _tabController.index = value;
        });
        if (value == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (value == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TaskView()));
        } else if (value == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReceivedOffers()));
        } else if (value == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserProfile()));
        }
      },
      icons: [
        PenduIcon.home,
        PenduIcon.tasks,
        PenduIcon.offers,
        PenduIcon.profile
      ],
      textStyle: TextStyle(color: Colors.black),
    );
  }
}
