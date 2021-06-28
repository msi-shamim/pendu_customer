import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/profile_screen/profile.dart';
import 'package:pendu_customer/profile_screen/task_view.dart';
import 'package:pendu_customer/screens/received_offers.dart';
import 'package:pendu_customer/utils/pendu_icon.dart';

class BottomNavigation extends StatefulWidget {
  final int initValue;
  final User user;
  final String token;
  BottomNavigation({this.initValue, this.user, this.token});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  //MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController =
    //     MotionTabController(initialIndex: 0, vsync: this, length: 4);
  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.initValue;
  User user = widget.user;
     String token = widget.token;
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.transparent,
        selectedItemBackgroundColor: Theme.of(context).accentColor,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black,
        showSelectedItemShadow: false,
        barHeight: 60,
      ),
      selectedIndex: selectedIndex,
      onSelectTab: (index) {
        setState(() {
          selectedIndex = index;

          if (selectedIndex == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage(user: user, token: token,)));
          } else if (selectedIndex == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TaskView(user: user, token: token,)));
          } else if (selectedIndex == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReceivedOffers(user: user, token: token,)));
          } else if (selectedIndex == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfile(user: user, token: token,)));
          }
        });
      },
      items: [
        FFNavigationBarItem(
          iconData: PenduIcon.home,
          label: 'Home',
        ),
        FFNavigationBarItem(
          iconData: PenduIcon.tasks,
          label: 'Tasks',
        ),
        FFNavigationBarItem(
          iconData: PenduIcon.offers,
          label: 'Offers',
        ),
        FFNavigationBarItem(
          iconData: PenduIcon.profile,
          label: 'My profile',
        ),
      ],
    );

    // return MotionTabBar(
    //   labels: ["Home", "Tasks", "Offers", "My profile"],
    //   initialSelectedTab: widget.initValue,
    //   tabIconColor: Colors.black,
    //   tabSelectedColor: Pendu.color('60E99C'),
    //   onTabItemSelected: (int value) {
    //     setState(() {
    //       _tabController.index = value;
    //     });
    //     if (value == 0) {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => HomePage()));
    //     } else if (value == 1) {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => TaskView()));
    //     } else if (value == 2) {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => ReceivedOffers()));
    //     } else if (value == 3) {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => UserProfile()));
    //     }
    //   },
    //   icons: [
    //     PenduIcon.home,
    //     PenduIcon.tasks,
    //     PenduIcon.offers,
    //     PenduIcon.profile
    //   ],
    //   textStyle: TextStyle(color: Colors.black),
    // );
  }
}
