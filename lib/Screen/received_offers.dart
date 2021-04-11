import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

class DriverDetails {
  final String name;
  final String picUrl;
  final String vehicletype;
  final String averageAccuracy;
  final String successRate;
  final String ratings;
  final String offerPrice;

  DriverDetails({
    this.name,
    this.picUrl,
    this.vehicletype,
    this.averageAccuracy,
    this.successRate,
    this.offerPrice,
    this.ratings,
  });
}

List<DriverDetails> driverList = [
  DriverDetails(
    name: 'Suji',
    picUrl: 'assets/',
    vehicletype: 'assets/car.svg',
    averageAccuracy: '89',
    successRate: '86',
    offerPrice: '15',
    ratings: '4.89',
  ),
  DriverDetails(
    name: 'Sonet',
    picUrl: 'assets/',
    vehicletype: 'assets/truck.svg',
    averageAccuracy: '85',
    successRate: '90',
    offerPrice: '17.30',
    ratings: '4.75',
  ),
  DriverDetails(
    name: 'Jamy',
    picUrl: 'assets/',
    vehicletype: 'assets/van.svg',
    averageAccuracy: '92',
    successRate: '89',
    offerPrice: '18.50',
    ratings: '4.83',
  ),
];

class ReceivedOffers extends StatefulWidget {
  @override
  _ReceivedOffersState createState() => _ReceivedOffersState();
}

class _ReceivedOffersState extends State<ReceivedOffers> {
  Widget _driverList() {
    return Container(
      child: ListView.builder(
        itemCount: driverList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 150,
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                elevation: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Pendu.color('5BDB98')),
                            child: Text('')))
                  ],
                ),
              )
              //Text(driverList[index].name),
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Received Offers'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressPageHeader(
              text: 'Offer from drivers',
            ),
            Expanded(child: _driverList()),
          ],
        ),
      ),
    );
  }
}
