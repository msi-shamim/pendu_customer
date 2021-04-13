import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

import 'screen_progress.dart';

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
  final _items = _category
      .map((category) => MultiSelectItem<Category>(category, category.title))
      .toList();
  _multiSelectedField() {
    return MultiSelectDialogField(
      chipDisplay: MultiSelectChipDisplay(
        chipColor: Colors.transparent,
        textStyle: TextStyle(color: Colors.black),
      ),
      checkColor: Pendu.color('60E99C'),
      confirmText: Text('CONFIRM',
          style: TextStyle(color: Pendu.color('60E99C'), fontSize: 16)),
      cancelText: Text('CANCEL',
          style: TextStyle(color: Pendu.color('FFB44A'), fontSize: 16)),
      items: _items,
      title: Container(
        //  alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Pendu.color('60E99C'),
        child: Center(child: Text("Categories")),
      ),
      selectedItemsTextStyle: TextStyle(color: Pendu.color('60E99C')),
      selectedColor: Pendu.color('ffffff'),
      unselectedColor: Pendu.color('ffffff'),
      decoration: BoxDecoration(
        color: Pendu.color('F1F1F1'),
        // borderRadius: BorderRadius.all(Radius.circular(40)),
        //   border: Border.all(color: Colors.blue, width: 2),
      ),
      buttonIcon:
          Icon(Icons.arrow_forward_ios, color: Pendu.color('90A0B2'), size: 16),
      buttonText: Text(
        'Tap to select your categories',
        style: TextStyle(color: Pendu.color('4CB08A')),
      ),
      onConfirm: (results) {
        //  _selectedAnimals = results;
      },
    );
  }

  Widget _buildProdcutDetails(String _title, int _quantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.lens_outlined, color: Pendu.color('4CB08A'), size: 20),
            SizedBox(width: 10),
            Text(
              _title,
              style: TextStyle(color: Pendu.color('4CB08A'), fontSize: 16),
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
              '$_quantity',
              style: TextStyle(color: Pendu.color('4CB08A'), fontSize: 18),
            ),
            Icon(
              Icons.add,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
        Icon(
          Icons.cancel,
          color: Pendu.color('FFDAA5'),
        )
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
              ScreenProgress(screenValue: 1),
              SizedBox(
                height: 15,
              ),
              ProgressPageHeader(text: 'Categories'),
              SizedBox(height: 8),
              //Todo
              _multiSelectedField(),
              // Container(
              //     width: double.infinity,
              //     height: 35,
              //     color: Pendu.color('F1F1F1'),
              //     padding: EdgeInsets.symmetric(horizontal: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Tap to select your categories',
              //           style: TextStyle(
              //             color: Pendu.color('4CB08A'),
              //           ),
              //         ),
              //         IconButton(
              //             padding: EdgeInsets.only(left: 20),
              //             onPressed: () {
              //               showDialog(
              //                 context: context,
              //                 builder: (BuildContext context) =>
              //                     _buildPopupDialog(context),
              //               );
              //             },
              //             icon: Icon(
              //               Icons.arrow_forward_ios,
              //               color: Pendu.color('90A0B2'),
              //               size: 16,
              //             ))
              //       ],
              //     )),
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
                      _buildProdcutDetails('Toothpaste', 2),
                      _buildProdcutDetails('Brush-Oral', 2),
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
                    hintText: 'Enter your total cost of the items',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Pendu.color('5BDB98'),
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
