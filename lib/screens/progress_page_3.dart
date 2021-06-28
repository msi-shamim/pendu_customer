
import 'package:flutter/material.dart';
import 'package:pendu_customer/screens/received_offers.dart';
import 'package:pendu_customer/screens/screen_progress.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/models/response_delivery_time.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/screen_common/request_status.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/delivery_address_table.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

List<String> titleList = [
  'ASAP',
  '4Hrs',
  '6Hrs',
  'Same day',
  'Next day',
  'Set Later'
];

class ProgressPage3 extends StatefulWidget {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation ;
  final String dropUpLocation;
  final int selectedIndex;
  final  List<DeliveryTimeList> deliveryTimeList;
  ProgressPage3({@required this.user, @required this.token, @required this.adNotes, @required this.totalCost, @required this.dropUpLocation, @required this.pickUpLocation, @required this.selectedIndex, @required this.deliveryTimeList});
  @override
  _ProgressPage3State createState() => _ProgressPage3State(user, token, adNotes, totalCost, pickUpLocation, dropUpLocation, selectedIndex, deliveryTimeList );
}

class _ProgressPage3State extends State<ProgressPage3> {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation ;
  final String dropUpLocation;
  final int selectedIndex;
  final  List<DeliveryTimeList> deliveryTimeList;
  _ProgressPage3State(this.user, this.token,  this.adNotes,this.totalCost, this.pickUpLocation, this.dropUpLocation, this.selectedIndex, this.deliveryTimeList);
//Can not find this variable at UI
  String title;
  Widget _deliveryContainer() {
    return Container(
      height: 120,
      // color: Colors.blue,
      child: GridView.builder(
        itemCount: deliveryTimeList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4),
        itemBuilder: (context, position) {
          return Card(
              color: (selectedIndex == position) ? Colors.green : null,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    deliveryTimeList[position].title,
                    style: TextStyle(
                      color: (selectedIndex == position)
                          ? Colors.white
                          : Colors.green,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Place & Request'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenProgress(screenValue: 3),
              SizedBox(height: 10),
              DeliverAddressTable(
                colorCode: Colors.grey[200],
                pickUpLocation: pickUpLocation,
                dropUpLocation: dropUpLocation,
              ),
              SizedBox(height: 10),
              ProgressPageHeader(
                text: 'Delivery Time',
              ),
              _deliveryContainer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Item Cost'),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.green[50],
                    ),
                    child: Center(
                      child: Text(
                        '\$ $totalCost',
                        style: TextStyle(fontSize: 24, color: Colors.green),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 150,
              ),
              AuthButton(
                btnText: 'Post Delivery Request',
                onPressed: () {
                  _postDeliveryRequest();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _postDeliveryRequest () {

    var acceptOffer = CallApi(context);
    acceptOffer.callTaskShopDropApi(token,title ,pickUpLocation, dropUpLocation, adNotes, selectedIndex, double.parse(totalCost));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RequestStatus(user: user, token: token,)),
    );
  }
}
