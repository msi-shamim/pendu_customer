import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Model/recent_drop_model.dart';

import 'package:pendu_customer/network_data/recent_drop_network.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

List<RecentDrop> _recentDropList = [
  RecentDrop(
      imgUrl:
          "https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg",
      title: 'Buy some groceries for me',
      product: 'x3',
      price: 30,
      ratings: 5.00),
  RecentDrop(
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-51Utmw56FMBsmHRdRVn8awPHOdTeu0Qsiw&usqp=CAU",
      title: 'Shifted home to other city',
      product: 'x10',
      price: 200,
      ratings: 4.0),
  RecentDrop(
      imgUrl:
          "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70",
      title: 'Transfer Electronics',
      product: 'x5',
      price: 50,
      ratings: 4.5),
];
// RecentDropNetwork cVar = new RecentDropNetwork();
// RecentDrop mVar = new RecentDrop();
// List<RecentDrop> variB = mVar._recenDropList;

class RecentDrops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int i2) => Divider(),
        //todo
        itemCount: _recentDropList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            padding: EdgeInsets.all(2.0),
            width: 260,
            decoration: BoxDecoration(
                border: Border.all(color: Pendu.color('60E99C')),
                borderRadius: BorderRadius.circular(8.0)),
            child: Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(
                      left: 3.0, top: 3.0, bottom: 3.0, right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: NetworkImage(_recentDropList[index].imgUrl),
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 130, child: Text(_recentDropList[index].title)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_recentDropList[index].product),
                        SizedBox(width: 65),
                        Text('\$${_recentDropList[index].price}',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 16.0,
                          color: Pendu.color('FFB44A'),
                        ),
                        SizedBox(width: 5.0),
                        Text('${_recentDropList[index].ratings}'),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
