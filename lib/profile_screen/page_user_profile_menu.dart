import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/screens/page_message_screen.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/profile_screen/popup_app_version.dart';
import 'package:pendu_customer/profile_screen/page_blog_list.dart';
import 'package:pendu_customer/profile_screen/page_chat_list.dart';
import 'package:pendu_customer/profile_screen/page_user_profile_info.dart';
import 'package:pendu_customer/profile_screen/page_payment_history.dart';
import 'package:pendu_customer/profile_screen/page_pendu_pay.dart';
import 'package:pendu_customer/profile_screen/page_policies.dart';
import 'package:pendu_customer/profile_screen/profile_notification.dart';
import 'package:pendu_customer/profile_screen/page_recent_deliveries_list.dart';
import 'package:pendu_customer/profile_screen/page_refer_earn.dart';
import 'package:pendu_customer/profile_screen/page_task_view.dart';
import 'package:pendu_customer/utils/utils_bottom_nav_bar.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page_app_permission.dart';
import 'page_become_driver.dart';
import 'page_history_list.dart';
import 'menu_button_icon.dart';

class UserProfileMenuPage extends StatefulWidget {
 final  User user;
 final String token;
 UserProfileMenuPage({@required this.user, @required this.token});
  @override
  _UserProfileMenuPageState createState() => _UserProfileMenuPageState(user, token);
}

class _UserProfileMenuPageState extends State<UserProfileMenuPage> {
  final User user;
  final String token;
  _UserProfileMenuPageState(this.user, this.token);


  final picker = ImagePicker();
  File _image;

  @override
  void initState() {
    print('UserP Profile : $user');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Future getCameraImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getGalaryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getGalaryImage();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getCameraImage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
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
                            //!Profile Pic error
                            backgroundImage: NetworkImage((_image != null)
                                ? FileImage(_image)
                                : 'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg'), //(userVar["profile_photo"])

                            radius: 35,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 4,
                          child: InkWell(
                            onTap: () {
                              _showPicker();
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
                     user.name != null ? user.name : 'User Name',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 18),
                    ),
                    Text(
                      user.phone != null ? user.phone : 'XXX XXXX XXX',
                      style:
                          TextStyle(color: Pendu.color('90A0B2'), fontSize: 14),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
              MenuButtonList(),
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
              color: Theme.of(context).accentColor,
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
        bottomNavigationBar: BottomNavigationUtils(initValue: 3, user: user, token: token,),
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
                              builder: (context) => ChatListPage()),
                        );
                      },
                      child:
                          _buildHeaderButton('assets/messeges.svg', 'Inbox')),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskViewPage(user: user, token: token)),
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
                            builder: (context) => RecentDeliveriesListPage()),
                      );
                    },
                    child: _buildHeaderButton(
                      'assets/deliveries.svg',
                      'Deliveries',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryListPage()),
                      );
                    },
                    child: _buildHeaderButton(
                      'assets/history.svg',
                      'History',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              //Todo Container with menulist
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserProfileInfoPage(user: user, token: token,)));
                            },
                            child: _menuItem(
                                imgLink: 'assets/profile.svg',
                                title: 'Account details')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentHistoryPage()));
                            },
                            child: _menuItem(
                                imgLink: 'assets/payment.svg',
                                title: 'Payments')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PenduPayPage()));
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
                                      builder: (context) => ReferNEarnPage(
                                            user: user,
                                          )));
                            },
                            child: _menuItem(
                                imgLink: 'assets/refer and earn.svg',
                                title: 'Refer and earn')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlogPage(token)));
                            },
                            child: _menuItem(
                                imgLink: 'assets/blogs.svg', title: 'Blogs')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppPermissionPage()));
                            },
                            child: _menuItem(
                                imgLink: 'assets/settings 2.svg',
                                title: 'Permissions')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BecomeDriverPage()));
                            },
                            child: _menuItem(
                                imgLink: 'assets/become droper.svg',
                                title: 'Become a dropper')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MessageScreenPage()));
                            },
                            child: _menuItem(
                                imgLink: 'assets/support.svg',
                                title: 'Chat support')),
                        InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ProgressPage3()));
                            },
                            child: _menuItem(
                                imgLink: 'assets/faq.svg', title: 'FAQ')),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PoliciesPage()));
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
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
