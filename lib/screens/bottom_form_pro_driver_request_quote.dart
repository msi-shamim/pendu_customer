import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class ProDriverRequestQuoteBottomForm extends StatefulWidget {
  const ProDriverRequestQuoteBottomForm({Key key}) : super(key: key);

  @override
  _ProDriverRequestQuoteBottomFormState createState() => _ProDriverRequestQuoteBottomFormState();
}

class _ProDriverRequestQuoteBottomFormState extends State<ProDriverRequestQuoteBottomForm> {
  String _chosenValue;
  BoxDecoration commonBoxDecoration = BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0));
  TextStyle hintTextStyle = TextStyle(fontSize: 16, color: Colors.black54);
  TextStyle headerTextStyle =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

  Widget _buildServiceDropDown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: commonBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select Service',
            style: hintTextStyle,
          ),
          DropdownButton<String>(
            value: _chosenValue,
            elevation: 0,
            style: TextStyle(color: Colors.black),
            underline: SizedBox(),
            icon: Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Colors.black,
            ),
            items: <String>[
              'Drop & Down',
              'Collect & Deliver',
              'Mover',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(
              "",
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.only(left: 10.0),
      decoration: commonBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: hintTextStyle,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30,
              ))
        ],
      ),
    );
  }

  Widget _buildTextField({int maxLine, String hintText}) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
      decoration: commonBoxDecoration,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        maxLines: maxLine,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintTextStyle,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      //  width: MediaQuery.of(context).size.width * 0.50,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).accentColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text('Request quote'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: ListView(
        children: [
          _buildServiceDropDown(),
          _buildCategories(),
          Text('Products', style: headerTextStyle),
          _buildTextField(
              maxLine: 5, hintText: 'Use a Comma between Multiple Products.'),
          _buildTextField(maxLine: 1, hintText: 'Product Cost'),
          Text('Enter shops/ Pickup address', style: headerTextStyle),
          _buildTextField(maxLine: 1, hintText: 'Enter shops/ Pickup address'),
          Text('Enter delivery address', style: headerTextStyle),
          _buildTextField(maxLine: 1, hintText: 'Delivery address'),
          Text('Offered delivery fee', style: headerTextStyle),
          _buildTextField(maxLine: 1, hintText: 'Delivery fee'),
          _buildButton()
        ],
      ),
    );
  }
}
