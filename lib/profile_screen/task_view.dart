import 'package:flutter/material.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/profile_screen/task_in_progress_.dart';
import 'package:pendu_customer/profile_screen/task_pending.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/nav_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

TextStyle myStyle = TextStyle(fontSize: 17, color: Colors.black);

class TaskView extends StatefulWidget {
  final User user;
  final String token;
  TaskView({@required this.user, @required this.token});
  @override
  _TaskViewState createState() => _TaskViewState(user, token);
}

class _TaskViewState extends State<TaskView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final User user;
  final String token;
  _TaskViewState(this.user,this.token);
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
        bottomNavigationBar: BottomNavigation(initValue: 1, user: user, token: token,),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar('Task'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ButtonsTabBar(
                      height: 50,
                      contentPadding: EdgeInsets.symmetric(horizontal: 40),
                      backgroundColor: Theme.of(context).accentColor,
                      unselectedBackgroundColor: Colors.white,
                      borderColor: Theme.of(context).accentColor,
                      borderWidth: 2,
                      unselectedBorderColor: Pendu.color('707070'),
                      labelStyle: TextStyle(color: Colors.white),
                      unselectedLabelStyle:
                          TextStyle(color: Pendu.color('707070')),
                      tabs: [
                        Tab(child: Center(child: Text('In Progress'))),
                        Tab(child: Center(child: Text('  Pending  '))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        TaskInProgress(),
                        TaskPending(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
