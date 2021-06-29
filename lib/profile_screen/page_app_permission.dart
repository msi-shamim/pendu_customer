import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/page_user_profile_menu.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AppPermissionModel {
  final String permissionTitle;
  bool permissionStatus;
  AppPermissionModel({this.permissionStatus, this.permissionTitle});
}

List<AppPermissionModel> _appPermissionList = [
  AppPermissionModel(permissionTitle: 'Location', permissionStatus: true),
  AppPermissionModel(
      permissionTitle: 'Phone call & SMS', permissionStatus: false),
  AppPermissionModel(permissionTitle: 'Storage', permissionStatus: false),
  AppPermissionModel(
      permissionTitle: 'Push notification', permissionStatus: true),
];

class AppPermissionPage extends StatefulWidget {
  const AppPermissionPage({Key key}) : super(key: key);

  @override
  _AppPermissionPageState createState() => _AppPermissionPageState();
}

class _AppPermissionPageState extends State<AppPermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Permissions',
          )),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Pendu.color('1B3149'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.separated(
                  separatorBuilder: (BuildContext context, int i2) => Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  shrinkWrap: true,
                  itemCount: _appPermissionList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _appPermissionList[index].permissionTitle,
                          style: TextStyle(fontSize: 16),
                        ),
                        FlutterSwitch(
                          width: 50.0,
                          height: 20.0,
                          valueFontSize: 12.0,
                          toggleSize: 20.0,
                          value: _appPermissionList[index].permissionStatus,
                          borderRadius: 15.0,
                          // padding: 8.0,
                          activeColor: Pendu.color('56CD93'),
                          inactiveColor: Pendu.color('F97A7A'),
                          activeText: 'On',
                          inactiveText: 'Off',
                          showOnOff: true,

                          onToggle: (val) {
                            setState(() {
                              _appPermissionList[index].permissionStatus = val;
                            });
                          },
                        )
                      ],
                    );
                  },
                ),
                SizedBox(height: 200),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfileMenuPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Theme.of(context).accentColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // side: BorderSide(
                      //   color: Pendu.color('90A0B2'),
                      // ),
                    ),
                    child: Text('Save & Return'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
