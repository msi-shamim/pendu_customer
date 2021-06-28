import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/screens/progress_page_2.dart';
import 'package:pendu_customer/screens/select_dropup_point.dart';
import 'package:pendu_customer/screens/select_picup_point.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/models/response_product_categories_model.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';
import 'package:pendu_customer/utils/progress_page_headertext.dart';
import 'package:pendu_customer/utils/snackBar_page.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';

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
  bool isSelect;

  Category({this.id, this.title, this.isSelect});
}

List<Category> _categoryList = [
  Category(id: 1, title: "Groceries", isSelect: false),
  Category(id: 2, title: "Documents", isSelect: false),
  Category(id: 3, title: "Electronis", isSelect: false),
  Category(id: 4, title: "Furniture", isSelect: false),
  Category(id: 5, title: "Cloths", isSelect: false),
  Category(id: 6, title: "Foods", isSelect: false),
  Category(id: 7, title: "Office Staffs", isSelect: false),
  Category(id: 8, title: "Pet", isSelect: false),
  Category(id: 9, title: "Plants", isSelect: false),
  Category(id: 10, title: "Live Food", isSelect: false),
];

class ProgressPage1 extends StatefulWidget {
  final User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation;
  final String dropUpLocation;

  ProgressPage1(
      {@required this.user,
      @required this.token,
      this.pickUpLocation,
      this.dropUpLocation,
      this.adNotes,
      this.totalCost});

  @override
  _ProgressPage1State createState() => _ProgressPage1State(
      user, token, pickUpLocation, dropUpLocation, adNotes, totalCost);
}

class _ProgressPage1State extends State<ProgressPage1> {
  final User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation;

  final String dropUpLocation;

  _ProgressPage1State(this.user, this.token, this.pickUpLocation,
      this.dropUpLocation, this.adNotes, this.totalCost);

  List<ProductCategoryList> _pCategoryList;
  final _formKey = GlobalKey<FormState>();
  final notesController = TextEditingController();
  final totalCostController = TextEditingController();

  @override
  void initState() {
    notesController.text = adNotes;
    totalCostController.text = totalCost;

    if (token != null) {
      FetchDataUtils(context).getProductCategories(token).then((value) {
        setState(() {
          _pCategoryList = value;
        });
      });
    } else {
      SnackBarClass.snackBarMethod(
          message: "Something went wrong", context: context);
    }

    super.initState();
  }

  @override
  void dispose() {
    notesController.dispose();
    totalCostController.dispose();
    super.dispose();
  }

  Future buildText() {
    return Future.delayed(
        Duration(milliseconds: 100), () => print('waiting...'));
  }

  Widget _buildProductDetails() {
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

  @override
  Widget build(BuildContext context) {
    _buildMultiselect() {
      return showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.60,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: ListView(
                  children: [
                    Text(
                      'Select Categories',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 320,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: FutureBuilder(
                        future: buildText(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              _pCategoryList != null) {
                            return ListView.builder(
                              itemCount: _pCategoryList.length,
                              itemBuilder: (context, index) {
                                return StatefulBuilder(
                                  builder: (context, _setState) =>
                                      CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: Theme.of(context).accentColor,
                                    autofocus: true,
                                    dense: true,
                                    title: Text(
                                      _pCategoryList[index].title,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  //  selected: _categoryList[index].isSelect,
                                   value: true,
                                    onChanged: (bool value) {
                                      _setState(() {
                                      //  _categoryList[index].isSelect = value;
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Theme.of(context).accentColor,
                            ));
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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

    Widget _buildMultiSelect() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
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
      );
    }

    Widget _buildProductContainer() {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          color: Pendu.color('E7F9EF'),
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductDetails(),
              InkWell(
                onTap: () => {},
                child: Text(
                  '+ Add another',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            ],
          ));
    }

    Widget _buildNotesTextField() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Pendu.color('E7F9EF'),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          validator: (note) {
            if (note == null || note.isEmpty) {
              return 'Additional Notes is required';
            }
            return null;
          },
          controller: notesController,
          decoration: InputDecoration(
            hintText: 'Type your additional notes here',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      );
    }

    Widget _buildItemCostTextField() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          validator: (cost) {
            if (cost == null || cost.isEmpty) {
              return 'Total Cost is required';
            }
            return null;
          },
          controller: totalCostController,
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
      );
    }

    Widget _buildPickUpTextField() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: (pickUpLocation != null)
                    ? Text(
                        pickUpLocation,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        "Select Your pickup address",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectPickupPoint(
                              user: user,
                              token: token,
                              adNotes: notesController.text,
                              totalCost: totalCostController.text,
                            )),
                  );
                },
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Pendu.color('FFB44A'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildDropUpTextField() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: (dropUpLocation != null)
                    ? Text(
                        dropUpLocation,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        "Select Your delivery address",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectDropUpPoint(
                              user: user,
                              token: token,
                              adNotes: notesController.text,
                              totalCost: totalCostController.text,
                              pickUpLocation: pickUpLocation,
                            )),
                  );
                },
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Shop & Drop'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenProgress(screenValue: 1),
                SizedBox(height: 15),
                ProgressPageHeader(text: 'Categories'),
                SizedBox(height: 8),
                //Todo
                // _multiSelectedField(),
                _buildMultiSelect(),
                SizedBox(height: 10),
                ProgressPageHeader(text: 'Products'),
                SizedBox(height: 8),
                BottomWarringText(
                    borderColor: Pendu.color('E8E8E8'),
                    textColor: Pendu.color('FFB44A'),
                    text:
                        'Please Provide clear name & details if you have it, You will receive photos of the items once shopper begin the shipping'),
                // Product Container
                SizedBox(height: 10),
                _buildProductContainer(),

                ProgressPageHeader(text: 'Additional Notes'),

                _buildNotesTextField(),

                _buildItemCostTextField(),

                ProgressPageHeader(text: 'Enter shops/Pickup address'),

                _buildPickUpTextField(),

                ProgressPageHeader(text: 'Enter delivery address'),

                _buildDropUpTextField(),

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
                        if (_formKey.currentState.validate()) {
                          _nextPage();
                        }
                      },
                    )
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _nextPage() {
    if (pickUpLocation != null && dropUpLocation != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProgressPage2(
                  user: user,
                  token: token,
                  adNotes: notesController.text,
                  totalCost: totalCostController.text,
                  pickUpLocation: pickUpLocation,
                  dropUpLocation: dropUpLocation,
                )),
      );
    } else {
      SnackBarClass.snackBarMethod(
          message: 'Please select location', context: context);
    }
  }
}
