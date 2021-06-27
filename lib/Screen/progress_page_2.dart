import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/progress_page_3.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/model/response_delivery_time.dart';
import 'package:pendu_customer/model/response_login_model.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/Screen/screen_progress.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';
import 'package:pendu_customer/utils/snackBar_page.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';


class ProgressPage2 extends StatefulWidget {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation ;
  final String dropUpLocation;
  ProgressPage2({@required this.user, @required this.token, @required this.adNotes, @required this.totalCost, @required this.dropUpLocation, @required this.pickUpLocation});
  @override
  _ProgressPage2State createState() => _ProgressPage2State(user, token, adNotes, totalCost, pickUpLocation, dropUpLocation );
}

class _ProgressPage2State extends State<ProgressPage2> {
  final  User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation ;
  final String dropUpLocation;
  _ProgressPage2State(this.user, this.token,  this.adNotes,this.totalCost, this.pickUpLocation, this.dropUpLocation);
  int selectedIndex = -1;

  List<DeliveryTimeList> _deliveryTimeList;

  @override
  void initState() {
    if(token != null){
      FetchDataUtils(context).getDeliveryTimeInfo(token).then((value){
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
                child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                ));
          } }, ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Shop & Drop'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //   Timeline(),
              ScreenProgress(screenValue: 2),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeader(text: 'Delivery Time'),
              _deliveryContainer(),
              BottomWarringText(
                  textColor: Pendu.color('FFB44A'),
                  borderColor: Pendu.color('E8E8E8'),
                  text:
                      'You can also sort out the delivery times with your dropper directly, You wonn\'t be charged until you accept an offer'),
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButtonCustom(),
                  ProgressButton(
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
          builder: (context) => ProgressPage3(user: user, token: token, adNotes: adNotes, totalCost: totalCost, pickUpLocation: pickUpLocation,dropUpLocation: dropUpLocation, selectedIndex: selectedIndex, deliveryTimeList: _deliveryTimeList,)),);
    }
    else
{
  SnackBarClass.snackBarMethod(message: "Something went wrong", context: context);
}
  }
}
