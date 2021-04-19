import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

import 'congratulation_page.dart';

class BecomeDriverForm extends StatelessWidget {
  Widget _builtTextField(
      {String title, String svgUrl, String hinText, bool isSufix = false}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgUrl,
              height: 18,
              width: 18,
              color: Pendu.color('5BDB98'),
            ),
            SizedBox(width: 5.0),
            Text(title),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          //   height: hight != 0 ? hight : 200,
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hinText,
              filled: true,
              fillColor: Pendu.color('F9F9F9'),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Pendu.color('F9F9F9'),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Pendu.color('5BDB98'),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: isSufix
                  ? Icon(
                      Icons.unfold_more_rounded,
                      color: Pendu.color('90A0B2'),
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _uploadButton(BuildContext context) {
    return DottedBorder(
      color: Pendu.color('5BDB98'),
      borderType: BorderType.RRect,
      dashPattern: [4, 4],
      strokeWidth: 1,
      radius: Radius.circular(5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: 45,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Pendu.color('F6FEFA'),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            // side: BorderSide(
            //   color: Pendu.color('90A0B2'),
            // ),
          ),
          child: SvgPicture.asset(
            'assets/upload.svg',
            height: 40,
            width: 40,
            color: Pendu.color('5BDB98'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Become a driver',
          )),
      body: SingleChildScrollView(
        child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _builtTextField(
                  title: 'ABN',
                  svgUrl: 'assets/ABN.svg',
                  hinText: '*** *** *** ***',
                ),
                _builtTextField(
                    title: 'Vehicle type',
                    svgUrl: 'assets/vehicle_type.svg',
                    hinText: 'Select your vehicle',
                    isSufix: true),
                _builtTextField(
                    title: 'Please select category',
                    svgUrl: 'assets/category.svg',
                    hinText: 'Select your category',
                    isSufix: true),
                SizedBox(height: 10.0),
                Text('Upload driving licence -Front & Back'),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _uploadButton(context),
                    _uploadButton(context),
                  ],
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CongratulationPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Pendu.color('5BDB98'),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // side: BorderSide(
                      //   color: Pendu.color('90A0B2'),
                      // ),
                    ),
                    child: Text('Submit application'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
