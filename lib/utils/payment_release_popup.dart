import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/paymnet_release_popup2.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:slide_button/slide_button.dart';

class PaymentReleased extends StatefulWidget {
  @override
  _PaymentReleasedState createState() => _PaymentReleasedState();
}

class _PaymentReleasedState extends State<PaymentReleased> {
  double _rating;

  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),

        // height: MediaQuery.of(context).size.height - 200,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/release_payment.png'),
                IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: Icon(
                      Icons.cancel_rounded,
                      color: Pendu.color('FFEBCF'),
                    )),
              ],
            ),

            //Todo Header

            SizedBox(height: 10),
            Text(
              'Payment released!',
              style: TextStyle(
                  color: Pendu.color('000000'),
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: 10),
            Divider(
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 10),
            //Todo Text
            Text(
              'Review your experience',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 12,
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: 20),
            //Todo Rating Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overall rating',
                  style: TextStyle(
                      color: Pendu.color('000000'),
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
                Container(
                  width: 130,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Pendu.color('E7F8EF'),
                    //border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: RatingBar(
                    onRatingChanged: (rating) => _rating = rating,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star,
                    //   halfFilledIcon: Icons.star_half,
                    isHalfAllowed: false,
                    filledColor: Pendu.color('FFB44A'),
                    emptyColor: Colors.white,
                    //  halfFilledColor: Colors.amberAccent,
                    size: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            //Todo Accurecy progress bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order accuracy',
                  style: TextStyle(
                      color: Pendu.color('000000'),
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
                //Todo Slide Button
                Container(
                  height: 15,
                  width: 160,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      //  activeTrackColor: Colors.red,
                      //   inactiveTrackColor: Colors.green,

                      trackHeight: 4.0,
                      thumbShape: SliderComponentShape.noThumb,
                      //overlayColor: Colors.white.withOpacity(.4),
                      //valueIndicatorColor: Colors.white,
                      //activeTickMarkColor: Colors.white,
                      // inactiveTickMarkColor: Colors.red.withOpacity(.7),
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      activeColor: Theme.of(context).accentColor,
                      inactiveColor: Pendu.color('E8E8E8'),
                      divisions: 100,
                      label: _currentSliderValue.round().toString() + '%',
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            //Todo Text Field
            SizedBox(height: 20),
            Container(
              height: 160,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Pendu.color('FFF7EC'),
                //border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write your experience here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            //todo Submit Button

            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => PaymentRelesedPopUp2(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
