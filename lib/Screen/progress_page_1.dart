import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:pendu_customer/Screen/select_picup_point.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

import 'screen_progress.dart';

class ItemModel {
  final String itemName;
  final int itemQuantity;
  ItemModel({this.itemName, this.itemQuantity});
}

List<ItemModel> _itemList = [
  ItemModel(itemName: 'Toothpaste(2x)', itemQuantity: 2),
  ItemModel(itemName: 'Brush-Oral B (2x)', itemQuantity: 1)
];

class Category {
  final int id;
  final String title;

  Category({
    this.id,
    this.title,
  });
}

List<Category> _category = [
  Category(id: 1, title: "Groceries"),
  Category(id: 2, title: "Documents"),
  Category(id: 3, title: "Electronis"),
  Category(id: 4, title: "Furniture"),
  Category(id: 5, title: "Cloths"),
  Category(id: 6, title: "Foods"),
  Category(id: 7, title: "Office Staffs"),
  Category(id: 8, title: "Pet"),
  Category(id: 9, title: "Plants"),
  Category(id: 10, title: "Live Food"),
];

class ProgressPage1 extends StatefulWidget {
  @override
  _ProgressPage1State createState() => _ProgressPage1State();
}

class _ProgressPage1State extends State<ProgressPage1> {
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

  _buildMultiselect() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.60,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: ListView(
                children: [
                  Text(
                    'Select Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  //!Multiselec work
                  //Todo Listview Builder work
                  Container(
                      height: 200,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Theme.of(context).accentColor,
                        title: Text('user'),
                        value: true,
                        onChanged: (bool selected) {
                          //onUserSelected(selected, user.uid);
                          if (selected == true) {
                            setState(() {});
                          }
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CloseButtonCustom(),
                      ProgressButton(
                        btnText: 'Next',
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ));
        });
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
              ScreenProgress(screenValue: 1),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeader(text: 'Categories'),
              SizedBox(height: 8),
              //Todo
              // _multiSelectedField(),
              Container(
                color: Colors.grey[200],
                height: 40,
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tap to select your categories',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                    IconButton(
                        onPressed: () {
                          _buildMultiselect();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Products'),
              SizedBox(height: 8),
              BottomWarringText(
                  borderColor: Pendu.color('E8E8E8'),
                  textColor: Pendu.color('FFB44A'),
                  text:
                      'Please Provide clear name & details if you have it, You will recieve photos of the items once shopper begin the shipping'),
              //Todo Product Container
              SizedBox(height: 10),
              Container(
                  color: Pendu.color('E7F9EF'),
                  width: double.infinity,
                  height: 200,
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
                      )
                    ],
                  )),
              SizedBox(height: 10),
              ProgressPageHeader(text: 'Additional Notes'),
              SizedBox(height: 8),
              //Todo TextField
              Container(
                color: Pendu.color('E7F9EF'),
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
                    prefixIcon: Container(
                      width: 10,
                      alignment: Alignment.center,
                      child: Text(
                        "\$",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 20),
                      ),
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
                    hintText: 'Enter your pickup address',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectPicupPoint()),
                        );
                      },
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Pendu.color('FFB44A'),
                      ),
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
              BottomWarringText(
                  borderColor: Pendu.color('E8E8E8'),
                  textColor: Pendu.color('FFB44A'),
                  text:
                      'Youwill be asked to security hold the funds in the app after you have accepted an offer & you will onlu be paying for the item you requested.'),
              SizedBox(height: 10),
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
                            builder: (context) => SelectPicupPoint()),
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
