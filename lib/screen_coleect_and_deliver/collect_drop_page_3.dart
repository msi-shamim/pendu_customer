import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/screens/received_offers.dart';
import 'package:pendu_customer/screen_common/request_status.dart';
import 'package:pendu_customer/screens/screen_progress.dart';
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

class CollectDropPage3 extends StatefulWidget {
  @override
  _CollectDropPage3State createState() => _CollectDropPage3State();
}

class _CollectDropPage3State extends State<CollectDropPage3> {
  int selectedIndex = -1;
  Widget _deliveryContainer() {
    return Container(
      height: 120,
      // color: Colors.blue,
      child: GridView.builder(
        itemCount: titleList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4),
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () => setState(() => selectedIndex = position),
            child: Card(
                color: (selectedIndex == position) ? Colors.green : null,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      titleList[position],
                      style: TextStyle(
                        color: (selectedIndex == position)
                            ? Colors.white
                            : Colors.green,
                      ),
                    ),
                  ),
                )),
          );
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vehicle type-'),
                    Image.asset('assets/car.png')
                  ],
                ),
              ),
              SizedBox(height: 10),
              DeliverAddressTable(
                colorCode: Colors.grey[200],
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
                        '\$ 251',
                        style: TextStyle(fontSize: 24, color: Colors.green),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              AuthButton(
                btnText: 'Post Your Request',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReceivedOffers()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
