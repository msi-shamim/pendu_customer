import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/task.dart';
import 'package:pendu_customer/profile_screen/task2.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

TextStyle myStyle = TextStyle(fontSize: 17, color: Colors.black);

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  buildTab(String name) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('707070')),
          color:
              (tabController.index == 0) ? Colors.red : Pendu.color('5BDB98'),
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar('Task'),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorWeight: .01,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Pendu.color('8F8F8F'),
              controller: tabController,
              tabs: [
                buildTab('In Progress'),
                buildTab('Pending'),
              ],
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                TaskInProgress(),
                TaskPending(),
              ]),
            ),
          ],
        ));
  }
}
