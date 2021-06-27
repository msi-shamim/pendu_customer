import 'package:flutter/material.dart';

import 'package:pendu_customer/Screen/select_picup_point.dart';

import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';

import '../Screen/screen_progress.dart';

class ItemModel {
  final String itemName;
  final double itemPrice;
  final int itemQuantity;
  ItemModel({this.itemName, this.itemPrice, this.itemQuantity});
}

List<ItemModel> _itemList = [
  ItemModel(itemName: 'Toothpaste(2x)', itemPrice: 10, itemQuantity: 2),
  ItemModel(itemName: 'Brush-Oral B (2x)', itemPrice: 15, itemQuantity: 1)
];

class CollectDropPage1 extends StatefulWidget {
  @override
  _CollectDropPage1State createState() => _CollectDropPage1State();
}

class _CollectDropPage1State extends State<CollectDropPage1> {
  TextEditingController _textFieldController = TextEditingController();
  String codeDialog;
  String valueText;
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Input Product Details'),
            //Todo Textfield need to added
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        valueText = value;
                      });
                    },
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Product Title"),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        valueText = value;
                      });
                    },
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Product Price"),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        valueText = value;
                      });
                    },
                    controller: _textFieldController,
                    decoration: InputDecoration(hintText: "Product Quantity"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Pendu.color('5BDB98'),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(' Save '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

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
              SizedBox(
                //width: 50,
                child: Text(
                  '\$${_itemList[index].itemPrice}',
                  style: TextStyle(color: Pendu.color('4CB08A'), fontSize: 16),
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

  Widget _buildProductListBox() {
    return Container(
        color: Pendu.color('E7F9EF'),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProdcutDetails(),
            InkWell(
              onTap: () => {_displayTextInputDialog(context)},
              child: Text(
                '+ Add another',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ));
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vehicle type-'),
                    Image(
                      image: AssetImage('assets/car.png'),
                      height: 40,
                      width: 60,
                      fit: BoxFit.fill,
                    )
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
              ProgressPageHeader(
                  text: 'Please list the items you need collected'),
              SizedBox(height: 8),
              BottomWarringText(
                  borderColor: Pendu.color('E8E8E8'),
                  textColor: Pendu.color('FFB44A'),
                  text:
                      'Please provide the name and quantity of the thing you need collected & Add photos only if you have them.'),
              //Todo Product Container
              SizedBox(height: 10),

              _buildProductListBox(),
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
              BottomWarringText(
                  borderColor: Pendu.color('E8E8E8'),
                  textColor: Pendu.color('FFB44A'),
                  text:
                      'No Purchases- Dropper would not be able to make any purchase. Restricted item - Please don\'t hand over any restricted item.'),
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
