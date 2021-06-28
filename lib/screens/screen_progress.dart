import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:timelines/timelines.dart';

class ScreenProgress extends StatelessWidget {
  final int screenValue;

  ScreenProgress({@required this.screenValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1
          TimelineTile(
            direction: Axis.horizontal,
            nodeAlign: TimelineNodeAlign.start,
            oppositeContents: null,
            contents: Container(
              padding: EdgeInsets.only(top: 5.0, right: 15.0),
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
                  backgroundColor: (screenValue >= 1)
                      ? Theme.of(context).accentColor
                      : Pendu.color('90A0B2'),
                ),
              ),
              endConnector: Connector.solidLine(
                color: (screenValue > 1)
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
              padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0),
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
                  backgroundColor: (screenValue >= 2)
                      ? Theme.of(context).accentColor
                      : Pendu.color('90A0B2'),
                ),
              ),
              // startConnector: DashedLineConnector(color: Pendu.color('60E99C'),),
              endConnector: Connector.solidLine(
                color: (screenValue > 2)
                    ? Pendu.color('60E99C')
                    : Pendu.color('90A0B2'),
              ),
              startConnector: Connector.solidLine(
                color: (screenValue >= 2)
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
              padding: EdgeInsets.only(left: 15.0, top: 5.0),
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
                  backgroundColor: (screenValue >= 3)
                      ? Theme.of(context).accentColor
                      : Pendu.color('90A0B2'),
                ),
              ),
              // startConnector: DashedLineConnector(color: Pendu.color('60E99C'),),

              startConnector: Connector.solidLine(
                color: (screenValue >= 3)
                    ? Pendu.color('60E99C')
                    : Pendu.color('90A0B2'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
