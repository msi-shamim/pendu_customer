import 'package:flutter/material.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/profile_screen/page_task_in_progress_.dart';
import 'package:pendu_customer/profile_screen/page_task_pending.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_bottom_nav_bar.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

TextStyle myStyle = TextStyle(fontSize: 17, color: Colors.black);

class TaskViewPage extends StatefulWidget {
  final User user;
  final String token;
  TaskViewPage({@required this.user, @required this.token});
  @override
  _TaskViewPageState createState() => _TaskViewPageState(user, token);
}

class _TaskViewPageState extends State<TaskViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final User user;
  final String token;
  _TaskViewPageState(this.user,this.token);
  buildTab(String name) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          //border: Border.all(color: Pendu.color('707070')),
          borderRadius: BorderRadius.circular(5.0)),
      child: Center(child: Text(name)),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    setState(() {
      tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: BottomNavigationUtils(initValue: 1, user: user, token: token,),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: AppBarCommonUtils('Task'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: DefaultTabController(
            length: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonsTabBar(
              height: 50,
                  contentPadding: EdgeInsets.symmetric(horizontal: 40),
                  backgroundColor: Theme.of(context).accentColor,
                  unselectedBackgroundColor: Colors.white,

                  borderColor: Theme.of(context).accentColor,
                  borderWidth: 1,
                  unselectedBorderColor: Pendu.color('707070'),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      TextStyle(color: Pendu.color('707070')),
                  tabs: [
                    Tab( text:'In Progress',),
                    Tab(text:'  Pending  '),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      TaskInProgressPage(),
                      TaskPendingPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
