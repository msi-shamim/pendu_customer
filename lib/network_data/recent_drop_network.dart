import 'package:pendu_customer/models/recent_drop_model.dart';

class RecentDropNetwork {
  Future<List<RecentDrop>> getRecentDrop() async {
    List<RecentDrop> _recentDropList = [
      RecentDrop(
          imgUrl:
              "https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg",
          title: 'Buy some groceries for me',
          product: 'x3',
          price: 30,
          ratings: 5.00),
      RecentDrop(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-51Utmw56FMBsmHRdRVn8awPHOdTeu0Qsiw&usqp=CAU",
          title: 'Shifted home to other city',
          product: 'x10',
          price: 200,
          ratings: 4.0),
      RecentDrop(
          imgUrl:
              "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70",
          title: 'Transfer Electronics',
          product: 'x5',
          price: 50,
          ratings: 4.5),
      RecentDrop(
          imgUrl:
              "https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg",
          title: 'Buy some groceries for me',
          product: 'x3',
          price: 30,
          ratings: 5.00),
      RecentDrop(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-51Utmw56FMBsmHRdRVn8awPHOdTeu0Qsiw&usqp=CAU",
          title: 'Shifted home to other city',
          product: 'x10',
          price: 200,
          ratings: 4.0),
      RecentDrop(
          imgUrl:
              "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70",
          title: 'Transfer Electronics',
          product: 'x5',
          price: 50,
          ratings: 4.5),
    ];

    return _recentDropList;
  }
}
