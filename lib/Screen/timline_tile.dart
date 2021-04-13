import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
//import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';

class TineLine extends StatelessWidget {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        padding: EdgeInsets.only(top: 400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //1
            TimelineTile(
              direction: Axis.horizontal,
              nodeAlign: TimelineNodeAlign.start,
              oppositeContents: null,
              contents: Container(
                padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Text('Task details'),
              ),
              node: TimelineNode(
                indicator: ContainerIndicator(
                  child: CircleAvatar(
                    radius: 10,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    backgroundColor: (_value >= 1)
                        ? Pendu.color('5BDB98')
                        : Pendu.color('90A0B2'),
                  ),
                ),
                // DotIndicator(
                //   color: Pendu.color('FFFFFF'),
                //   child: Icon(
                //     Icons.check_circle,
                //     color: Pendu.color('2A8B00'),
                //   ),
                //),
                // startConnector: DashedLineConnector(color: Pendu.color('60E99C'),),
                endConnector: Connector.solidLine(
                  color: (_value > 1)
                      ? Pendu.color('60E99C')
                      : Pendu.color('90A0B2'),
                ),
              ),
            ),
            TimelineTile(
              direction: Axis.horizontal,
              nodeAlign: TimelineNodeAlign.start,
              oppositeContents: null,
              contents: Container(
                padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Text('Timeframe'),
              ),
              node: TimelineNode(
                indicator: ContainerIndicator(
                  child: CircleAvatar(
                    radius: 10,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    backgroundColor: (_value >= 2)
                        ? Pendu.color('5BDB98')
                        : Pendu.color('90A0B2'),
                  ),
                ),
                // startConnector: DashedLineConnector(color: Pendu.color('60E99C'),),
                endConnector: Connector.solidLine(
                  color: (_value > 2)
                      ? Pendu.color('60E99C')
                      : Pendu.color('90A0B2'),
                ),
                startConnector: Connector.solidLine(
                  color: (_value >= 2)
                      ? Pendu.color('60E99C')
                      : Pendu.color('90A0B2'),
                ),
              ),
            ),
            //3
            TimelineTile(
              direction: Axis.horizontal,
              nodeAlign: TimelineNodeAlign.start,
              oppositeContents: null,
              contents: Container(
                padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Text('Review & Submit'),
              ),
              node: TimelineNode(
                indicator: ContainerIndicator(
                  child: CircleAvatar(
                    radius: 10,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    backgroundColor: (_value >= 3)
                        ? Pendu.color('5BDB98')
                        : Pendu.color('90A0B2'),
                  ),
                ),
                // startConnector: DashedLineConnector(color: Pendu.color('60E99C'),),

                startConnector: Connector.solidLine(
                  color: (_value >= 3)
                      ? Pendu.color('60E99C')
                      : Pendu.color('90A0B2'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
