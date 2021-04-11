import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DeliverAddressTable extends StatelessWidget {
  final Color colorCode;
  DeliverAddressTable({this.colorCode});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: colorCode),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.green,
                size: 24,
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 65.0,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.grey,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              Icon(
                Icons.circle,
                color: Colors.orange,
                size: 14,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka, \n Abdul Goli MD Pur, Dhaka'),
                Text('2103 N Main St, Highlands, TX 77562'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
