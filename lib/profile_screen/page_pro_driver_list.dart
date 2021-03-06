import 'package:flutter/material.dart';
import 'package:pendu_customer/screens/bottom_form_pro_driver_request_quote.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

final List<String> _drivers = [
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
  'assets/driver_image.png',
];

class ProDriverListPage extends StatefulWidget {
  @override
  _ProDriverListPageState createState() => _ProDriverListPageState();
}

class _ProDriverListPageState extends State<ProDriverListPage> {
  _buildMultiselect() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return ProDriverRequestQuoteBottomForm();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: ProfileCommonAppbar(
              title: 'Pro Driver',
            )),
        body: Container(
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
            child: GridView.builder(
              itemCount: _drivers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      width: 170.0,
                      child: Card(
                        elevation: 3.0,
                        child: Column(
                          children: [
                            Image.asset(
                              _drivers[index],
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8, right: 8, top: 32, bottom: 4),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Success Rate')),
                                  Text(
                                    '5.00',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8, right: 8, top: 4, bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Accuracy Score')),
                                  Text('96',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 8, right: 8, top: 0, bottom: 8),
                              child: ElevatedButton(
                                onPressed: () {
                                  _buildMultiselect();
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Theme.of(context).accentColor,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text('Request a quote'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 80,
                      right: 10,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          width: 145,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '4.80',
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(),
                              Icon(
                                Icons.directions_car_outlined,
                                size: 14,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.card_giftcard_outlined,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
