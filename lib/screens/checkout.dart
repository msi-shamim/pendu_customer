import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendu_customer/screen_common/payment_done.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/delivery_address_table.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

class Products {
  final String productName;
  final double productPrice;

  Products({this.productName, this.productPrice});
}

List<String> paymentUrlList = [
  'assets/paypal_logo.png',
  'assets/visa_logo.png',
  'assets/mastercard_logo.png'
];

List<Products> productList = [
  Products(productName: 'Toothpaste(2x)', productPrice: 99.00),
  Products(productName: 'Brush-Oral(2x)', productPrice: 9.00),
  Products(productName: 'Burgers(2x)', productPrice: 14.00),
  Products(productName: 'Pizza(1x)', productPrice: 4.00),
];

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedIndex = -1;
  Widget _paymentContainer() {
    return Container(
      height: 80,
      // color: Colors.blue,
      child: GridView.builder(
        itemCount: paymentUrlList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () => setState(() => selectedIndex = position),
            child: Card(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (selectedIndex == position)
                            ? Colors.green
                            : Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        (selectedIndex == position)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        size: 14,
                        color: (selectedIndex == position)
                            ? Colors.green
                            : Colors.grey,
                      ),
                      Image.asset(paymentUrlList[position]),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget _productList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int i) =>
            Divider(height: 10, thickness: 1, indent: 0, endIndent: 0),
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productList[index].productName,
                    style: TextStyle(color: Pendu.color('90A0B2')),
                  ),
                  Text('\$${productList[index].productPrice}'),
                ],
              ),
            ],
          ));

          //Text(productList[index].productName)
        },
      ),
    );
  }

  Widget _rowList(String title, double money) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          '\$ $money',
          style: TextStyle(color: Pendu.color('90A0B2')),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('CheckOut'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              ProgressPageHeader(
                text: 'Products',
              ),
              //Todo ListView
              _productList(),
              SizedBox(height: 10),
              ProgressPageHeader(
                text: 'Delivery info',
              ),
              SizedBox(height: 10),
              //Todo Import Deliver Information
              DeliverAddressTable(
                colorCode: Colors.green[200],
              ),
              SizedBox(height: 10),
              ProgressPageHeader(
                text: 'Promo Code',
              ),
              SizedBox(height: 10),
              //Todo TextField
              Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffix: InkWell(
                      onTap: () {},
                      child: Text(
                        'APPLY',
                        style: TextStyle(
                          color: Pendu.color('FFCE8A'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ProgressPageHeader(
                text: 'Payment method',
              ),
              SizedBox(height: 10),
              //Todo  Checklist
              _paymentContainer(),
              //Todo Payment Table
              SizedBox(height: 10),
              Container(
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _rowList('Sub total', 180),
                      _rowList('Delivery fee offer', 15),
                      _rowList('Service fee(3%)', 5),
                      _rowList('Promo Code', 5),
                    ]),
              ),
              SizedBox(height: 10),
              //Todo Row Text+Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total : \$125.00',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                      // color: Colors.transparent,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Pendu.color('FFCE8A'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentDone()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Confirm',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_right_alt_sharp)
                            ],
                          )))
                ],
              ),
              SizedBox(height: 10),
              BottomWarringText(
                  borderColor: Pendu.color('E8E8E8'),
                  textColor: Pendu.color('FFB44A'),
                  text:
                      'Your funds will be securely held in "Pendu Pay" until the task is close.'),
              //Todo Warring Text
            ],
          ),
        ),
      ),
    );
  }
}
