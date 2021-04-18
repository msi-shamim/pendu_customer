import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
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
    name: 'Max Pain',
    lastMsg: 'When will you start?',
    imgUrl:
        'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
    date: '16:12:18',
    isOnline: true,
    mssgUnseenNumber: 2,
    isDeliver: false,
  ),
  ChatHome(
    name: 'Devid Broken',
    lastMsg: 'Thanks for your service',
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-51Utmw56FMBsmHRdRVn8awPHOdTeu0Qsiw&usqp=CAU',
    date: '11:10:18',
    isOnline: false,
    mssgUnseenNumber: 1,
    isDeliver: true,
  ),
  ChatHome(
    name: 'Bee Queen',
    lastMsg: 'It was great deal! :)',
    imgUrl:
        'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg',
    date: '05:07:18',
    isOnline: true,
    mssgUnseenNumber: 0,
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
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Chats'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int i2) => Divider(
              height: 15,
              thickness: 2,
              indent: 55,
            ),
            shrinkWrap: true,
            itemCount: _chatList.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //todo Image and online
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Pendu.color('5BDB98'),
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage:
                                NetworkImage(_chatList[index].imgUrl),
                          ),
                        ),
                        (_chatList[index].isOnline)
                            ? Positioned(
                                bottom: 10,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Pendu.color('5BDB98'),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    Container(
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width - 90,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //todo name & date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _chatList[index].name,
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  (_chatList[index].isDeliver)
                                      ? Icon(
                                          Icons.check,
                                          size: 12,
                                        )
                                      : SizedBox(),
                                  Text(
                                    _chatList[index].date,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          //todo last msg & msg number
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _chatList[index].lastMsg,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              (_chatList[index].mssgUnseenNumber == 0)
                                  ? SizedBox()
                                  : CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Pendu.color('5BDB98'),
                                      child: Text(
                                        '${_chatList[index].mssgUnseenNumber}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
