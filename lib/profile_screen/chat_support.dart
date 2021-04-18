import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'profile_common_appbar.dart';

class ChatHome {
  final String name;
  final String imgUrl;
  final String lastMsg;
  final String date;
  final int mssgUnseenNumber;
  final bool isOnline;
  final bool isDeliver;

  ChatHome(
      {this.name,
      this.imgUrl,
      this.lastMsg,
      this.date,
      this.isOnline,
      this.mssgUnseenNumber,
      this.isDeliver});
}

List<ChatHome> _chatList = [
  ChatHome(
    name: 'Lorem Ipsum',
    lastMsg: 'When will you start',
    imgUrl:
        'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
    date: '16:12:18',
    isOnline: true,
    mssgUnseenNumber: 2,
    isDeliver: true,
  ),
];

class ChatSupport extends StatefulWidget {
  @override
  _ChatSupportState createState() => _ChatSupportState();
}

class _ChatSupportState extends State<ChatSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Chats',
          )),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Pendu.color('1B3149'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int i2) => Divider(
                height: 10,
                thickness: 2,
              ),
              shrinkWrap: true,
              itemCount: _chatList.length,
              itemBuilder: (context, index) {
                return Text(_chatList[index].name);
              },
            ),
          ),
        ),
      ),
    );
  }
}
