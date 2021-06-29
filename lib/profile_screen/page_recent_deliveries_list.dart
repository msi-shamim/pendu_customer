import 'package:flutter/material.dart';
import 'package:pendu_customer/models/recent_drop_model.dart';
import 'package:pendu_customer/network_data/recent_drop_network.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class RecentDeliveriesListPage extends StatefulWidget {
  @override
  _RecentDeliveriesListPageState createState() => _RecentDeliveriesListPageState();
}

class _RecentDeliveriesListPageState extends State<RecentDeliveriesListPage> {
  RecentDrop recentDropVar;
  final RecentDropNetwork recentDropNetwork = RecentDropNetwork();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Recent Deliveries',
          )),
      body: Container(
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
          child: FutureBuilder(
            future: recentDropNetwork.getRecentDrop(),
            builder: (BuildContext context,
                AsyncSnapshot<List<RecentDrop>> snapshot) {
              if (snapshot.hasData) {
                List<RecentDrop> recentDropData = snapshot.data;
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: recentDropData
                      .map(
                        (RecentDrop recentDropVar) => Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          padding: EdgeInsets.only(
                              left: 2.0, right: 10.0, top: 2.0, bottom: 2.0),
                          //width: 300,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(color: Pendu.color('60E99C')),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 110,
                                margin: EdgeInsets.only(
                                    left: 3.0,
                                    top: 3.0,
                                    bottom: 3.0,
                                    right: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: NetworkImage(recentDropVar.imgUrl),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Expanded(
                                //width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 130,
                                        child: Text(recentDropVar.title)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(recentDropVar.product),
                                        Text('\$${recentDropVar.price}',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: Pendu.color('FFB44A'),
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          '${recentDropVar.ratings}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
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
        ),
      ),
    );
  }
}
