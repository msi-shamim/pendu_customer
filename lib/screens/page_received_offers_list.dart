import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/screens/page_checkout.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/models/response_recieve_offer_from_driver.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_bottom_nav_bar.dart';
import 'package:pendu_customer/utils/utils_text_progress_page.dart';
import 'package:pendu_customer/utils/utils_snackBar_message.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class ReceivedOffers extends StatefulWidget {
  final User user;
  final String token;
  ReceivedOffers({@required this.user, @required this.token});
  @override
  _ReceivedOffersState createState() => _ReceivedOffersState(user, token);
}

class _ReceivedOffersState extends State<ReceivedOffers> {
  final User user;
  final String token;
  int taskId = 1;
  _ReceivedOffersState(this.user,this.token);

  List<OffersFromDriverList> _offersList;
  @override
  void initState() {
    if(token != null){
      //TaskId=2 send
      FetchDataUtils(context).getOffersFromDriverInfo(token, taskId).then((value){
        setState(() {
          _offersList = value;
        });

      });}
    else{
      SnackBarClass.snackBarMethod(message: "Something went wrong", context: context);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future buildText() {
    return Future.delayed(Duration(seconds: 1), () => print('waiting...'));
  }
  Widget _driverList() {
    return Container(
child: FutureBuilder(
  future: buildText(),
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done &&
        _offersList != null) {
      return  ListView.builder(
        itemCount: _offersList.length,
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
                                          PenduConstants.baseUrl +  _offersList[index].dropper.profileImage),
                                      fit: BoxFit.cover),
                                ),
                              ),

                              Text(_offersList[index].dropper.fullName),
                              //Ratings Row
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14,
                                  ),
                                  Text(_offersList[index].dropper.rating),
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
                                percent:  double.parse(_offersList[index].dropper.averageAccuracy) / 100,
                                center: new Text(
                                  _offersList[index].dropper.averageAccuracy + '%',
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
                                double.parse(_offersList[index].dropper.successRate) / 100,
                                center: new Text(
                                  _offersList[index].dropper.successRate + '%',
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
                              Container(
                                height: 35,
                                width: 35,
                                child: SvgPicture.network(
                                 PenduConstants.baseUrl +  _offersList[index].dropper.vehicle.icon,
                                ),
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
                                      '\$' +  _offersList[index].amount,
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
                              _acceptOffer( _offersList[index].id);
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
      );
    }
    else {
      return Center(
          child: CircularProgressIndicator());
    } }, ),


    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationUtils(initValue: 2, user: user, token: token,),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarCommonUtils('Received Offers'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressPageHeaderTextUtils(
              text: 'Offer from drivers',
            ),
            Expanded(child: _driverList()),
          ],
        ),
      ),
    );
  }

  void _acceptOffer(int acceptOfferId) {

    var acceptOffer = CallApi(context);
    acceptOffer.callAcceptOfferApi(token, taskId, acceptOfferId );

    Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => CheckOutPage()));
  }
}
