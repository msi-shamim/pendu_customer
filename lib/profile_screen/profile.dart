import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/message_screen.dart';
import 'package:pendu_customer/Screen/progress_page_3.dart';
import 'package:pendu_customer/profile_screen/app_version_popup.dart';
import 'package:pendu_customer/profile_screen/blog_page.dart';
import 'package:pendu_customer/profile_screen/chat_support.dart';
import 'package:pendu_customer/profile_screen/my_profile.dart';
import 'package:pendu_customer/profile_screen/payment_history.dart';
import 'package:pendu_customer/profile_screen/policies.dart';
import 'package:pendu_customer/profile_screen/profile_notification.dart';
import 'package:pendu_customer/profile_screen/recent_deliveries.dart';

import 'package:pendu_customer/utils/pendu_theme.dart';

import 'app_permission.dart';
import 'become_driver.dart';
import 'menu_button_icon.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Widget _buildHeaderButton(String imgLink, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          imgLink,
          height: 40,
          width: 40,
          color: Colors.white,
        ),
        Text(title),
      ],
    );
  }

  Widget _buildAppbar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(200),
        //Full Container
        child: Container(
          padding: EdgeInsets.only(top: 20, right: 10.0, left: 10.0),
          height: 200,
          //  color: Pendu.color('1B3149'), //Theme.of(context).accentColor,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/profile_back.png'),
            fit: BoxFit.cover,
          )),
          //Circle 1
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              CircleAvatar(
                radius: 90,
                backgroundColor: Pendu.color('1B3149'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //circle 3
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Pendu.color('283848'),
                          child:
                              //circle 4
                              CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg'),
                            radius: 35,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 4,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyProfile()));
                            },
                            child: CircleAvatar(
                              backgroundColor: Pendu.color(
                                '60E99C',
                              ),
                              radius: 8,
                              child: Icon(
                                Icons.edit_outlined,
                                size: 15,
                                color: Pendu.color(
                                  'ffffff',
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Jenifer Doe',
                      style:
                          TextStyle(color: Pendu.color('5BDB98'), fontSize: 18),
                    ),
                    Text(
                      '+61 0215563***',
                      style:
                          TextStyle(color: Pendu.color('90A0B2'), fontSize: 14),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
              PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(child: MenuButtonList()),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _menuItem({String imgLink, String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              imgLink,
              height: 30.0,
              width: 30.0,
              color: Pendu.color('5BDB98'),
            ),
            SizedBox(width: 20),
            Text(title)
          ],
        ),
        Divider(
          height: 30,
          thickness: 2,
          color: Pendu.color('EDEDED'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: Container(
          color: Pendu.color('1B3149'),
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                color: Pendu.color('60E99C'),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Column(children: [
                //Todo Row with icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatSupport()),
                          );
                        },
                        child:
                            _buildHeaderButton('assets/messeges.svg', 'Inbox')),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProgressPage3()),
                        );
                      },
                      child: _buildHeaderButton(
                        'assets/tasks.svg',
                        'Tasks',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecentDeliveries()),
                        );
                      },
                      child: _buildHeaderButton(
                        'assets/deliveries.svg',
                        'Deliveries',
                      ),
                    ),
                    InkWell(
                      child: _buildHeaderButton(
                        'assets/history.svg',
                        'History',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                //Todo Container with menulist
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatSupport()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/profile.svg',
                              title: 'Account details')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymnetHistory()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/payment.svg',
                              title: 'Payments')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProgressPage3()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/pendupay.svg',
                              title: 'Pendu Pay')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileNotification()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/notification.svg',
                              title: 'Notification')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProgressPage3()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/refer and earn.svg',
                              title: 'Refer and earn')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlogPage()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/blogs.svg', title: 'Blogs')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppPermission()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/settings 2.svg',
                              title: 'Permissions')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BecomeDriver()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/become droper.svg',
                              title: 'Become a dropper')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MessageScreeen()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/support.svg',
                              title: 'Chat support')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProgressPage3()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/faq.svg', title: 'FAQ')),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Policies()));
                          },
                          child: _menuItem(
                              imgLink: 'assets/terms and conditions.svg',
                              title: 'Policies')),
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AppVersionPopUp(),
                            );
                          },
                          child: _menuItem(
                              imgLink: 'assets/app version.svg',
                              title: 'App version')),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
