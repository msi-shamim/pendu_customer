import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class PaymentDone extends StatelessWidget {
  Widget _instruction(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          color: Pendu.color('5BDB98'),
          size: 16,
        ),
        SizedBox(width: 30),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Payment done'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset('assets/payment_done.png'),
                Text(
                  'Payment Done!',
                  style: TextStyle(fontSize: 24, color: Pendu.color('5BDB98')),
                ),
                SizedBox(
                  height: 20,
                ),
                _instruction('Your payment security held in pendu pay'),
                SizedBox(height: 10),
                _instruction('Your droper has been notified'),
                SizedBox(height: 10),
                _instruction(
                    'Private chat directly with the dropper \nis now available \n (Please keep the communication within \nthe pendu platform to avoid any disputs)'),
                Text('')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 70,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Pendu.color('5BDB98')),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/chat.svg',
                                height: 20.0,
                                width: 20.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Chat',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 + 10,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange[200]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/check proccess.svg',
                                height: 20.0,
                                width: 20.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Check progress',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/home.svg',
                          height: 30.0,
                          width: 30.0,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Return home',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}