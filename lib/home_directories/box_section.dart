import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class IconMenu {
  final String svgPath;
  final String titleIcon;
  IconMenu({this.svgPath, this.titleIcon});
}

List<IconMenu> iconList = [
  IconMenu(
      svgPath: 'assets/secure cashless.svg',
      titleIcon: 'Secure cashless payment'),
  IconMenu(
      svgPath: 'assets/communication.svg', titleIcon: 'Built in communication'),
  IconMenu(
      svgPath: 'assets/communitu ratting.svg',
      titleIcon: 'Community Ratings & Reviews'),
  IconMenu(svgPath: 'assets/fair payment.svg', titleIcon: 'Fair payments'),
];

class BoxSection extends StatelessWidget {
  final double widthData;
  BoxSection({this.widthData});

  Widget _buildCell({int position}) {
    return Container(
      width: widthData,
      height: widthData,
      margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Pendu.color('F1F1F1'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            iconList[position].svgPath,
            color: Pendu.color('51BE8F'),
            width: 40,
            height: 50,
          ),
          Container(
            child: Text(
              iconList[position].titleIcon,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          //Cell 1
//Todo
          _buildCell(position: 0),
          _buildCell(position: 1),
        ]),
        TableRow(children: [
          _buildCell(position: 2),
          _buildCell(position: 3),
        ])
      ],
    );
    // Container(
    //   height: 280,
    //   // color: Colors.blue,
    //   child: GridView.builder(
    //     itemCount: iconList.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         childAspectRatio: 1.3,
    //         crossAxisSpacing: 1,
    //         mainAxisSpacing: 1),
    //     itemBuilder: (context, position) {
    //       return Container(
    //         margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
    //         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(5.0),
    //           color: Pendu.color('F1F1F1'),
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             SvgPicture.asset(
    //               iconList[position].svgPath,
    //               color: Pendu.color('51BE8F'),
    //               width: 40,
    //               height: 50,
    //             ),
    //             Container(
    //               child: Text(
    //                 iconList[position].titleIcon,
    //                 style: TextStyle(
    //                   fontSize: 14,
    //                   color: Colors.black,
    //                 ),
    //                 textAlign: TextAlign.center,
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
