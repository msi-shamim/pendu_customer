import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DeliverAddressTableUtils extends StatelessWidget {
  final Color colorCode;
  final String pickUpLocation ;
  final String dropUpLocation;
  DeliverAddressTableUtils({this.colorCode, this.dropUpLocation, this.pickUpLocation});
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
                Container(width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(pickUpLocation, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                Container(width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(dropUpLocation, maxLines: 1, overflow: TextOverflow.ellipsis,)),

              ],
            ),
          )
        ],
      ),
    );
  }
}
