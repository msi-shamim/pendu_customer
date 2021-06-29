import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pendu_customer/screens/page_shop_drop_2.dart';
import 'package:pendu_customer/screens/page_map_select_dropup_point.dart';
import 'package:pendu_customer/screens/page_map_select_picup_point.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/models/response_product_categories_model.dart';
import 'package:pendu_customer/utils/utils_text_bottom_warning.dart';
import 'package:pendu_customer/utils/utils_button_close.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:pendu_customer/utils/utils_button_progress.dart';
import 'package:pendu_customer/utils/utils_text_progress_page.dart';
import 'package:pendu_customer/utils/utils_snackBar_message.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';

import '../utils/utils_progress_delivery.dart';

class ProductModel {
  final String pTitle;
  final double pPrice;
   int pQuantity;

  ProductModel({this.pTitle, this.pPrice, this.pQuantity});
}

class ShopDropPage1 extends StatefulWidget {
  final User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation;
  final String dropUpLocation;

  ShopDropPage1(
      {@required this.user,
      @required this.token,
      this.pickUpLocation,
      this.dropUpLocation,
      this.adNotes,
      this.totalCost});

  @override
  _ShopDropPage1State createState() => _ShopDropPage1State(
      user, token, pickUpLocation, dropUpLocation, adNotes, totalCost);
}

class _ShopDropPage1State extends State<ShopDropPage1> {
  final User user;
  final String token;
  final String adNotes;
  final String totalCost;
  final String pickUpLocation;

  final String dropUpLocation;

  _ShopDropPage1State(this.user, this.token, this.pickUpLocation,
      this.dropUpLocation, this.adNotes, this.totalCost);
//All Category data list from api
  List<ProductCategoryList> _pCategoryListData;
  //Free List, it will send to api
  List<ProductCategoryList> _pCategoryList;
  //Convert List
  List<MultiSelectItem<ProductCategoryList>> _pCategoryItems;
  //Products list , it will send to api
  List<ProductModel> _productList = [];
  final _formKey = GlobalKey<FormState>();
  final notesController = TextEditingController();
  final totalCostController = TextEditingController();
  TextEditingController pTitleController = TextEditingController();
  TextEditingController pPriceController = TextEditingController();
  TextEditingController pQuantityController = TextEditingController();


  @override
  void initState() {
    if (token != null) {
      FetchDataUtils(context).getProductCategories(token).then((value) {
        setState(() {
          _pCategoryListData = value;
          _pCategoryItems = _pCategoryListData
              .map((service) => MultiSelectItem<ProductCategoryList>(service, service.title)).toList();
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
    pTitleController.dispose();
    pPriceController.dispose();
    pQuantityController.dispose();

    super.dispose();
  }

  Future buildText() {
    return Future.delayed(
        Duration(milliseconds: 100), () => print('waiting...'));
  }

  void _showCategoriesMultiSelect(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: MultiSelectBottomSheet(
            title: Text('Select Categories',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            items: _pCategoryItems,
            initialValue: _pCategoryList,
            selectedColor: Theme.of(context).accentColor,
            checkColor: Colors.white,
            maxChildSize: 0.8,
            initialChildSize: 0.4,
            confirmText: Text('Confirm',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                )),
            cancelText: Text('Cancel',
                style: TextStyle(
                  color: Colors.red,
                )),
            onConfirm: (values) {
              setState(() {
                _pCategoryList = values;
              });
            },
          ),
        );
      },
    );
    print('Selceted Service: $_pCategoryList');
  }

  void _showAddProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Container(
          height: 250.0,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Enter Product Details: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextField(
                  controller: pTitleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextField(
                  controller: pPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: TextField(
                  controller: pQuantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Quantity',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close',   style: TextStyle(
                          color: Pendu.color('FFB44A'),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        _addProductMethod();

                      },

                      child: Text('Add Product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _addProductMethod() {
    setState(() {
      _productList.add(ProductModel(
          pTitle: pTitleController.text,
          pPrice: double.parse(pPriceController.text),
          pQuantity: int.parse(pQuantityController.text)));

      pTitleController.clear();
      pPriceController.clear();
      pQuantityController.clear();
    });
  }
 void _removeProductMethod(String title) {
    setState(() {
      _productList.removeWhere((item) => item.pTitle == title);
    });
  }

  @override
  Widget build(BuildContext context) {

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
                 // _buildMultiselect();
                  _showCategoriesMultiSelect(context);
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
      return ListView.builder(
          itemCount: _productList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.lens_outlined,
                          color: Pendu.color('4CB08A'), size: 20),
                      SizedBox(width: 5),
                      Text(
                        _productList[index].pTitle,
                        style:
                        TextStyle(color: Pendu.color('4CB08A'), fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  //width: 50,
                  child: Text(
                    '\$${_productList[index].pPrice}',
                    style: TextStyle(color: Pendu.color('4CB08A'), fontSize: 16),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  //Todo Work
                      InkWell(
                        onTap: (){setState(() {
                          _productList[index].pQuantity--;
                        });},
                        child: Icon(
                          Icons.remove,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      Text(
                        '${_productList[index].pQuantity}',
                        style:
                        TextStyle(color: Pendu.color('4CB08A'), fontSize: 18),
                      ),
                      InkWell(
                        onTap: (){setState(() {
                          _productList[index].pQuantity++;
                        });},
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () =>  _removeProductMethod(_productList[index].pTitle) ,
                  child: Icon(
                    Icons.cancel,
                    color: Pendu.color('FFDAA5'),
                  ),
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
              _buildProductContainer(),
              InkWell(
                onTap: () => {_showAddProductBottomSheet(context)},
                child: Text(
                  '+ Add Product',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              SizedBox(height: 30.0),
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
                        builder: (context) => SelectPickupPointMapPage(
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
                        builder: (context) => SelectDropUpPointMapPage(
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
        child: AppBarCommonUtils('Shop & Drop'),
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
                ScreenProgressUtils(screenValue: 1),
                SizedBox(height: 15),
                ProgressPageHeaderTextUtils(text: 'Categories'),
                SizedBox(height: 8),
                _buildMultiSelect(),
                SizedBox(height: 10),
                ProgressPageHeaderTextUtils(text: 'Products'),
                SizedBox(height: 8),
                BottomWarringTextUtils(
                    borderColor: Pendu.color('E8E8E8'),
                    textColor: Pendu.color('FFB44A'),
                    text:
                        'Please Provide clear name & details if you have it, You will receive photos of the items once shopper begin the shipping'),
                // Product Container
                SizedBox(height: 10),
                _buildProductListBox(),

                ProgressPageHeaderTextUtils(text: 'Additional Notes'),

                _buildNotesTextField(),

                _buildItemCostTextField(),

                ProgressPageHeaderTextUtils(text: 'Enter shops/Pickup address'),

                _buildPickUpTextField(),

                ProgressPageHeaderTextUtils(text: 'Enter delivery address'),

                _buildDropUpTextField(),

                SizedBox(height: 10),
                BottomWarringTextUtils(
                    borderColor: Pendu.color('E8E8E8'),
                    textColor: Pendu.color('FFB44A'),
                    text:
                        'Youwill be asked to security hold the funds in the app after you have accepted an offer & you will onlu be paying for the item you requested.'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CloseButtonUtils(),
                    ButtonProgressUtils(
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
            builder: (context) => ShopDropPage2(
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
