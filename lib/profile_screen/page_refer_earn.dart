import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:flutter/services.dart';
import 'package:pendu_customer/utils/utils_snackBar_message.dart';
import 'package:social_share/social_share.dart';

class ReferNEarnPage extends StatefulWidget {
  final User user;

  const ReferNEarnPage({Key key, this.user}) : super(key: key);

  @override
  _ReferNEarnPageState createState() => _ReferNEarnPageState(user);
}

class _ReferNEarnPageState extends State<ReferNEarnPage> {
  final User user;
  _ReferNEarnPageState(this.user);
  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('90A0B2')),
          borderRadius: BorderRadius.circular(5.0)),
      child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Enter mail address',
              hintStyle: TextStyle(fontSize: 18)
              //border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              )),
    );
  }

  Widget _buildInviteBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
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
        child: Text(
          'Send invite',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildCopyLinkBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: user.referralLink));
          SnackBarClass.snackBarMethod(
              message: "Link Copied to Clipboard", context: context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Copy link',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildShareRow() {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Share- ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          InkWell(
              onTap: () {
                SocialShare.shareTwitter(
                  "Use pendu with this refeler link " +
                   user.referralLink,
                  hashtags: ["share", "pendu", "customer", "australia"],
                  url: "",
                  trailingText: "\nhello",
                ).then((data) {
                  print(data);
                });
              },
              child: SvgPicture.asset('assets/twitter2.svg')),
          SvgPicture.asset('assets/facebook3.svg'),
          SvgPicture.asset('assets/insta.svg'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Refer and earn',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/refer.svg',
                  color: Theme.of(context).accentColor,
                  height: 120,
                  width: 120,
                ),
                SizedBox(height: 20.0),
                Text("Invite a friend, you both get \$15",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 15.0),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem",
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.0),
                _buildTextField(),
                SizedBox(height: 20.0),
                _buildInviteBtn(),
                SizedBox(height: 20.0),
                Text('More ways to invite', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Pendu.color('F1F1F1')),
                  alignment: Alignment.center,
                  child: Text(
                   user.referralLink,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                SizedBox(height: 10.0),
                _buildCopyLinkBtn(),
                SizedBox(height: 15.0),
                _buildShareRow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
