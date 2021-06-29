import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/screens/pro_driver_request_quote.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/models/response_pro_driver_model.dart';

class DriverCard extends StatefulWidget {
  final ProDriverList proDriverList;

  DriverCard(this.proDriverList);

  @override
  State<StatefulWidget> createState() => _DriverCardState(proDriverList);
}

class _DriverCardState extends State<DriverCard> {
  final ProDriverList proDriverList;

  _DriverCardState(this.proDriverList);

  _buildProDriverForm() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return RequestQuote();
        });
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: 220.0,
            child: Card(
              elevation: 3.0,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          (proDriverList.profileImage != null)
                              ? PenduConstants.baseUrl +
                                  proDriverList.profileImage
                              : 'https://kwdev.nl/legenda-demo/wp-content/uploads/2013/12/delivery.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 8, right: 8, top: 45, bottom: 4),
                    child: Row(
                      children: [
                        Expanded(child: Text('Success Rate')),
                        Text(
                          (proDriverList.successRate != null)
                              ? proDriverList.successRate
                              : '**',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                    child: Row(
                      children: [
                        Expanded(child: Text('Accuracy Score')),
                        Text(
                            (proDriverList.averageAccuracy != null)
                                ? proDriverList.averageAccuracy
                                : '**',
                            style:
                                TextStyle(color: Theme.of(context).accentColor))
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        _buildProDriverForm();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).accentColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text('Request a quote'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 100,
            right: 0,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              elevation: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/pro_star.svg'),
                    SizedBox(width: 10),
                    Text(
                      (proDriverList.rating != null)
                          ? proDriverList.rating
                          : '*.**',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/pro_move.svg'),
                    SizedBox(width: 10),
                    SvgPicture.asset('assets/pro_gift.svg'),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
