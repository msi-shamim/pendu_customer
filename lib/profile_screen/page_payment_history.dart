import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class PaymentHistoryPage extends StatefulWidget {
  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

TextStyle blurStyle = new TextStyle(color: Pendu.color('90A0B2'));

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  Widget _buildMasterVisaCard() {
    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Pendu.color('F1F1F1'),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset('assets/visa_logo.png')),
              IconButton(
                  alignment: Alignment.topRight,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAlertDialoge(context),
                    );
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Pendu.color('FFCE8A'),
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            // width: double.infinity,
            // height: 40,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Pendu.color('ffffff'),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text('1254 25552 5225 ***', style: blurStyle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Pendu.color('ffffff'),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text('12/25', style: blurStyle),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Pendu.color('ffffff'),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text('4**', style: blurStyle),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPaypalCard() {
    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Pendu.color('F1F1F1'),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset('assets/paypal_logo.png'),
              ),
              IconButton(
                  alignment: Alignment.topRight,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAlertDialoge(context),
                    );
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Pendu.color('FFCE8A'),
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            // width: double.infinity,
            // height: 40,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Pendu.color('ffffff'),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text('Jonathan Doe', style: blurStyle),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Pendu.color('ffffff'),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text('Jonathan****@gmail.com', style: blurStyle),
          )
        ],
      ),
    );
  }

  Widget _buildAlertDialoge(BuildContext context) {
    return AlertDialog(
      title: SvgPicture.asset(
        'assets/error.svg',
        height: 50,
        width: 50,
        color: Pendu.color('F97A7A'),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Do you want to delete saved payment method?',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(
                        color: Pendu.color('F97A7A'),
                      ),
                    ),
                    child: Text('Yes'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(
                        color: Pendu.color('90A0B2'),
                      ),
                    ),
                    child: Text('No'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddCardTextField(
      {String title, String hintText, bool isObsecure}) {
    return Wrap(
  crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.0)),
          child: TextFormField(
            obscureText: isObsecure,
            decoration: InputDecoration(
              hintText: hintText,
              hintMaxLines: 1,
              isCollapsed: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          _buildAddCardForm();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).accentColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  _buildAddCardForm() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.60,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: ListView(
                children: [
                  _buildAddCardTextField(
                      title: 'Name on Card',
                      hintText: 'John',
                      isObsecure: false),
                  _buildAddCardTextField(
                      title: 'Card #',
                      hintText: 'Enter Your Card Number',
                      isObsecure: false),
                  _buildAddCardTextField(
                      title: 'Expiry', hintText: 'MM-YY', isObsecure: false),
                  _buildAddCardTextField(
                      title: 'CVV', hintText: '***', isObsecure: true),
                  SizedBox(height: 5.0),
                  _buildSaveButton()
                ],
              ));
        });
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          _buildAddCardForm();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).accentColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Add new payment method',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Payment History',
          )),
      body: SingleChildScrollView(
        child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildMasterVisaCard(),
                SizedBox(height: 20),
                _buildPaypalCard(),
                SizedBox(height: 50),
                _buildAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
