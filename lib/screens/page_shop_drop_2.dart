import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/screens/page_shop_drop_3.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/models/response_delivery_time.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/utils/utils_text_bottom_warning.dart';
import 'package:pendu_customer/utils/utils_progress_delivery.dart';
import 'package:pendu_customer/utils/utils_button_close.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:pendu_customer/utils/utils_button_progress.dart';
import 'package:pendu_customer/utils/utils_text_progress_page.dart';
import 'package:pendu_customer/utils/utils_snackBar_message.dart';
import 'package:pendu_customer/api/api_manipulation.dart';


class ShopDropPage2 extends StatefulWidget {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation ;
  final String dropUpLocation;
  ShopDropPage2({@required this.user, @required this.token, @required this.adNotes, @required this.totalCost, @required this.dropUpLocation, @required this.pickUpLocation});
  @override
  _ShopDropPage2State createState() => _ShopDropPage2State(user, token, adNotes, totalCost, pickUpLocation, dropUpLocation );
}

class _ShopDropPage2State extends State<ShopDropPage2> {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation ;
  final String dropUpLocation;
  _ShopDropPage2State(this.user, this.token,  this.adNotes,this.totalCost, this.pickUpLocation, this.dropUpLocation);
  int selectedIndex = -1;

  List<DeliveryTimeList> _deliveryTimeList;

  @override
  void initState() {
    if(token != null){
      ApiManipulation(context).getDeliveryTimeInfo(token).then((value){
        setState(() {
          _deliveryTimeList = value;
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
    return Future.delayed(Duration(microseconds: 0), () => print('waiting...'));
  }
  Widget _deliveryContainer() {
    return Container(
      height: 340,
      // color: Colors.blue,
      child:  FutureBuilder(
        future: buildText(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              _deliveryTimeList != null) {
            return GridView.builder(
              itemCount: _deliveryTimeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
              itemBuilder: (context, position) {
                return InkWell(
                  onTap: () => setState(() => selectedIndex = position),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                      color:
                      (selectedIndex == position) ? Pendu.color('EEFEF5') : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.network( PenduConstants.baseUrl +
                          _deliveryTimeList[position].icon,
                          color: Pendu.color('90A0B2'),
                          width: 50,
                          height: 50,
                        ),
                        Container(
                          width: 65,
                          child: Text(
                            _deliveryTimeList[position].title,
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).accentColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarCommonUtils('Shop & Drop'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //   Timeline(),
              ScreenProgressUtils(screenValue: 2),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeaderTextUtils(text: 'Delivery Time'),
              _deliveryContainer(),
              BottomWarringTextUtils(
                  textColor: Pendu.color('FFB44A'),
                  borderColor: Pendu.color('E8E8E8'),
                  text:
                      'You can also sort out the delivery times with your dropper directly, You wonn\'t be charged until you accept an offer'),
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButtonUtils(),
                  ButtonProgressUtils(
                    btnText: 'Review',
                    onPressed: () {
                     _gotoReviewPage();

                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _gotoReviewPage() {
    if(selectedIndex >= 0){
      Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => ShopDropPage3(user: user, token: token, adNotes: adNotes, totalCost: totalCost, pickUpLocation: pickUpLocation,dropUpLocation: dropUpLocation, selectedIndex: selectedIndex, deliveryTimeList: _deliveryTimeList,)),);
    }
    else
{
  SnackBarClass.snackBarMethod(message: "Something went wrong", context: context);
}
  }
}
