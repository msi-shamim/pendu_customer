import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

import 'screen_progress.dart';

class ProgressPage1 extends StatefulWidget {
  @override
  _ProgressPage1State createState() => _ProgressPage1State();
}

class _ProgressPage1State extends State<ProgressPage1> {
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Container(
        height: 60,
        // width: double.infinity,
        color: Theme.of(context).primaryColor,
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
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
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenProgress(ticks: 1),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeader(text: 'Categories'),
              SizedBox(height: 8),
              //Todo
              Container(
                  width: double.infinity,
                  height: 35,
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tap to select your categories',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.only(left: 20),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 16,
                          ))
                    ],
                  )),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Products'),
              SizedBox(height: 8),
              BottomWarringText(
                  text:
                      'Please Provide clear name & details if you have it, You will recieve photos of the items once shopper begin the shipping'),
              //Todo Product Container
              SizedBox(height: 10),
              Container(
                  color: Colors.green[50],
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.lens_outlined,
                                  color: Colors.green, size: 20),
                              SizedBox(width: 10),
                              Text(
                                'Toothpaste(2x)',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.remove,
                                color: Colors.grey,
                                size: 18,
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.close_outlined,
                            color: Colors.red,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => {},
                        child: Text(
                          '+ Add another',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Additional Notes'),
              SizedBox(height: 8),
              //Todo TextField
              Container(
                color: Colors.green[50],
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type your additional notes here',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // //Todo TextField
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your total cost of the items',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.money_outlined,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Enter shops/Pickup address'),
              SizedBox(height: 8),
              //Todo TextField
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your total cost of the items',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Enter delivery address'),
              SizedBox(height: 8),
              //Todo TextField
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your total cost of the items',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              BottomWarringText(
                  text:
                      'Youwill be asked to security hold the funds in the app after you have accepted an offer & you will onlu be paying for the item you requested.'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButtonCustom(),
                  ProgressButton(btnText: 'Next')
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
