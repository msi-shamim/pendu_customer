import 'package:flutter/material.dart';
import 'package:pendu_customer/screens/select_dropup_point.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/current_location_popup.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';


class SelectPickupPoint extends StatefulWidget {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  SelectPickupPoint({@required this.user, @required this.token, @required this.adNotes, @required this.totalCost});
  @override
  _SelectPickupPointState createState() => _SelectPickupPointState(user, token, adNotes,totalCost );
}

class _SelectPickupPointState extends State<SelectPickupPoint> {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  String pickUpLocation=   '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka 1204';
  _SelectPickupPointState(this.user, this.token, this.adNotes, this.totalCost);
  Widget _buildPickUpSection(){
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(-1, -3),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select your pickup location'),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Pendu.color('F1FBF5'))),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Pendu.color('D6D6D6')),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                  width: 210,
                  child: Text(pickUpLocation,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ))
            ]),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectDropUpPoint(user: user, token: token, pickUpLocation: pickUpLocation,)),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Pendu.color('60E99C'),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar('Select Pickup Point'),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: AssetImage("assets/map.png"),
                fit: BoxFit.fill,
              )),
            ),
            Positioned(
              top: 0,
              child: CurrentLocationPopup(),
            ),
            Positioned(bottom: 15, child: _buildPickUpSection()),
          ],
        ));
  }
}
