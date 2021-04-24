import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/checkout.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/nav_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DriverDetails {
  final String name;
  final String picUrl;
  final String vehicletype;
  final int averageAccuracy;
  final int successRate;
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
    picUrl:
        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    vehicletype: 'assets/mintruck.png',
    averageAccuracy: 89,
    successRate: 86,
    offerPrice: '15',
    ratings: '4.89',
  ),
  DriverDetails(
    name: 'Sonet',
    picUrl:
        'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg',
    vehicletype: 'assets/ute.png',
    averageAccuracy: 85,
    successRate: 90,
    offerPrice: '17.30',
    ratings: '4.75',
  ),
  DriverDetails(
    name: 'Jamy',
    picUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-51Utmw56FMBsmHRdRVn8awPHOdTeu0Qsiw&usqp=CAU',
    vehicletype: 'assets/van.png',
    averageAccuracy: 92,
    successRate: 89,
    offerPrice: '18.50',
    ratings: '4.83',
  ),
  DriverDetails(
    name: 'Max',
    picUrl:
        'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
    vehicletype: 'assets/car.png',
    averageAccuracy: 60,
    successRate: 40,
    offerPrice: '13.20',
    ratings: '3.5',
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
          return SingleChildScrollView(
            child: Container(
                // padding: EdgeInsets.only(left: 10),
                height: 160,
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  elevation: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Avobe Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //left side column
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${driverList[index].picUrl}'),
                                      fit: BoxFit.cover),
                                ),
                              ),

                              Text(driverList[index].name),
                              //Ratings Row
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14,
                                  ),
                                  Text(driverList[index].ratings),
                                ],
                              )
                            ],
                          ),
//Average Accurency Colimn
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 5.0,
                                percent: driverList[index]
                                        .averageAccuracy
                                        .toDouble() /
                                    100,
                                center: new Text(
                                  '${driverList[index].averageAccuracy}' + '%',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Theme.of(context).accentColor,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Average\nAccuracy',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
//Success Rate Column
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 5.0,
                                percent:
                                    driverList[index].successRate.toDouble() /
                                        100,
                                center: new Text(
                                  '${driverList[index].successRate}' + '%',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Theme.of(context).accentColor,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Success\nRate',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
//Vehicle Type Column
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                (driverList[index].vehicletype != null)
                                    ? driverList[index].vehicletype
                                    : 'assets/car.png',
                                //color: Theme.of(context).accentColor,
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Vehicle\nType',
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 10.0,
                                      backgroundColor: Colors.grey[400],
                                      child: Text(
                                        'X',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red[50],
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      '\$' + driverList[index].offerPrice,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),

                      //Button Container
                      Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckOut()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).accentColor,
                              ),
                              child: Text('Accept Offer')))
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(initValue: "Offers"),
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
