import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/models/recent_drop_model.dart';

import 'package:pendu_customer/network_data/recent_drop_network.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class RecentDrops extends StatelessWidget {
  final RecentDropNetwork recentDropNetwork = RecentDropNetwork();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: FutureBuilder(
        future: recentDropNetwork.getRecentDrop(),
        builder:
            (BuildContext context, AsyncSnapshot<List<RecentDrop>> snapshot) {
          if (snapshot.hasData) {
            List<RecentDrop> recentDropData = snapshot.data;
            return ListView(
              scrollDirection: Axis.horizontal,
              children: recentDropData
                  .map(
                    (RecentDrop recentDropVar) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
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
                                  image: NetworkImage(recentDropVar.imgUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            width: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 130,
                                    child: Text(recentDropVar.title)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(recentDropVar.product),
                                    Text('\$${recentDropVar.price}',
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
                                    Text('${recentDropVar.ratings}'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
