import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_text_bottom_warning.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class TermsConditionsListPage extends StatefulWidget {
  const TermsConditionsListPage({Key key}) : super(key: key);

  @override
  _TermsConditionsListPageState createState() => _TermsConditionsListPageState();
}

class _TermsConditionsListPageState extends State<TermsConditionsListPage> {
  String dText =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit.';
  Widget _buildTextArea({int slNum}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('0' + '$slNum' + '. ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold)),
                Text('Lorem ipsum dolor',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                dText,
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5)),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Terms & Conditions',
          )),
      body: Container(
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
          child: ListView(
            children: [
              _buildTextArea(slNum: 1),
              _buildTextArea(slNum: 2),
              _buildTextArea(slNum: 3),
              _buildTextArea(slNum: 4),
              _buildTextArea(slNum: 5),
            ],
          ),
        ),
      ),
    );
  }
}
