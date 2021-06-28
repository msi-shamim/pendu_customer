import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pendu_customer/screens/select_picup_point.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

import '../screens/screen_progress.dart';

class ItemModel {
  final String itemName;
  final int itemQuantity;
  ItemModel({this.itemName, this.itemQuantity});
}

List<ItemModel> _itemList = [
  ItemModel(itemName: 'Furniture', itemQuantity: 10),
  ItemModel(itemName: 'Beds', itemQuantity: 1)
];

class VehicleModel {
  final String imgLink;
  final String name;
  VehicleModel({this.imgLink, this.name});
}

List<VehicleModel> _vehicleList = [
  VehicleModel(imgLink: 'assets/car.png', name: 'Car'),
  VehicleModel(imgLink: 'assets/ute.png', name: 'Ute'),
  VehicleModel(imgLink: 'assets/van.png', name: 'Van'),
  VehicleModel(imgLink: 'assets/mintruck.png', name: 'Mini truck'),
  VehicleModel(imgLink: 'assets/ute.png', name: 'Ute'),
  VehicleModel(imgLink: 'assets/van.png', name: 'Van'),
];

class MoversPage1 extends StatefulWidget {
  @override
  _MoversPage1State createState() => _MoversPage1State();
}

class _MoversPage1State extends State<MoversPage1> {
  int selectedIndex = -1;
  Widget _buildProdcutDetails() {
    return ListView.builder(
        itemCount: _itemList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lens_outlined,
                        color: Pendu.color('4CB08A'), size: 20),
                    SizedBox(width: 10),
                    Text(
                      _itemList[index].itemName,
                      style:
                          TextStyle(color: Pendu.color('4CB08A'), fontSize: 16),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.remove,
                      color: Colors.grey,
                      size: 18,
                    ),
                    Text(
                      '${_itemList[index].itemQuantity}',
                      style:
                          TextStyle(color: Pendu.color('4CB08A'), fontSize: 18),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.cancel,
                color: Pendu.color('FFDAA5'),
              )
            ],
          );
        });
  }

  Widget _buildVehicleList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _vehicleList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => setState(() => selectedIndex = index),
            child: (selectedIndex == index)
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Image(
                          height: 38,
                          width: 45,
                          fit: BoxFit.fill,
                          image: AssetImage(_vehicleList[index].imgLink),
                        ),
                        Text(
                          _vehicleList[index].name,
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).accentColor),
                        )
                      ],
                    ),
                  )
                : Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                    child: Column(
                      children: [
                        ImageFiltered(
                          imageFilter:
                              ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                          child: Image(
                            height: 30,
                            width: 35,
                            fit: BoxFit.fill,
                            image: AssetImage(_vehicleList[index].imgLink),
                          ),
                        ),
                        Text(
                          _vehicleList[index].name,
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Movers'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenProgress(screenValue: 1),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Vehicle type-'),
                    Container(
                        width: 180,
                        height: 60,
                        child: Expanded(child: _buildVehicleList())),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ProgressPageHeader(text: 'Task title'),
              SizedBox(height: 8),
              //Todo
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your title here',
                    hintStyle: TextStyle(color: Pendu.color('4CB08A')),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Items'),
              SizedBox(height: 8),
              BottomWarringText(
                  borderColor: Pendu.color('E8E8E8'),
                  textColor: Pendu.color('FFB44A'),
                  text:
                      'Please provide clear name and details for the movers to give you an accirate quote.'),
              //Todo Product Container
              SizedBox(height: 10),
              Container(
                  color: Pendu.color('E7F9EF'),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProdcutDetails(),
                      InkWell(
                        onTap: () => {},
                        child: Text(
                          '+ Add another',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  )),
              SizedBox(height: 10),

              ProgressPageHeader(text: 'Pickup address'),
              SizedBox(height: 8),
              //Todo TextField
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your pickup address',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Pendu.color('FFB44A'),
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
                    hintText: 'Enter your delivery address',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Pendu.color('90A0B2')),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Add photos to the task (Optional)'),
                    SvgPicture.asset('assets/image_add.svg'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CloseButtonCustom(),
                  ProgressButton(
                    btnText: 'Next',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectPickupPoint()),
                      );
                    },
                  )
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
