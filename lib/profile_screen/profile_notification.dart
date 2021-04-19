import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

enum NotificationType { requestAccepted, referralCompleted, paymentMethodAdded }

class ProfileNotificationModel {
  final String notificationTitle;
  final String notificationBody;
  final NotificationType notificationType;
  final String notificationDate;
  ProfileNotificationModel(
      {this.notificationTitle,
      this.notificationBody,
      this.notificationType,
      this.notificationDate});
}

List<ProfileNotificationModel> _notificationList = [
  ProfileNotificationModel(
      notificationTitle: 'Payment method added',
      notificationBody:
          "Lorem ipsum dolor sit amet, adipiscing elit,sed do eiusmod tempor ut labore et dolore magna aliqua.",
      notificationType: NotificationType.paymentMethodAdded,
      notificationDate: '10 Oct, 2020'),
  ProfileNotificationModel(
      notificationTitle: 'Referral completed',
      notificationBody:
          "Lorem ipsum dolor sit amet, adipiscing elit,sed do eiusmod tempor ut labore et dolore magna aliqua.",
      notificationType: NotificationType.referralCompleted,
      notificationDate: '10 Oct, 2020'),
  ProfileNotificationModel(
      notificationTitle: 'Request accepted',
      notificationBody:
          "Lorem ipsum dolor sit amet, adipiscing elit,sed do eiusmod tempor ut labore et dolore magna aliqua.",
      notificationType: NotificationType.requestAccepted,
      notificationDate: '10 Oct, 2020'),
];

class ProfileNotification extends StatefulWidget {
  @override
  _ProfileNotificationState createState() => _ProfileNotificationState();
}

class _ProfileNotificationState extends State<ProfileNotification> {
  Widget _leadImg(ProfileNotificationModel notVar) {
    switch (notVar.notificationType) {
      case NotificationType.paymentMethodAdded:
        return SvgPicture.asset(
          'assets/payment_method.svg',
          height: 30,
          width: 30,
          color: Pendu.color('5BDB98'),
        );
        break;
      case NotificationType.referralCompleted:
        return SvgPicture.asset(
          'assets/refer and earn.svg',
          height: 30,
          width: 30,
          color: Pendu.color('5BDB98'),
        );
        break;
      case NotificationType.requestAccepted:
        return SvgPicture.asset(
          'assets/request_accepted.svg',
          height: 30,
          width: 30,
          color: Pendu.color('5BDB98'),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Notification',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  '10 Oct, 2020',
                  style: TextStyle(color: Pendu.color('90A0B2')),
                ),
              ),
              Container(
                // height: 200,
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Pendu.color('E8E8E8')),
                  borderRadius: BorderRadius.circular(8.0),
                  //color: Colors.red,
                ),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int i2) => Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  shrinkWrap: true,
                  itemCount: _notificationList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      leading: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Pendu.color('E7F8EF'),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: _leadImg(_notificationList[index]),
                      ),
                      title: Text(
                        _notificationList[index].notificationTitle,
                        maxLines: 1,
                        //textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        _notificationList[index].notificationBody,
                        maxLines: 3,
                      ),
                      // isThreeLine: true,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
