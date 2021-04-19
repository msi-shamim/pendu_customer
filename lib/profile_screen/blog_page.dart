import 'package:flutter/material.dart';
import 'package:pendu_customer/Model/blog_model.dart';
import 'package:pendu_customer/network_data/blog_network.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final BlogNetwork blogNetwork = BlogNetwork();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Blogs',
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Pendu.color('1B3149'),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: Column(
            children: [
              //todo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sort by'),
                  Container(
                    height: 25,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 5),
                        Text('All'),
                        Icon(
                          Icons.unfold_more_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(thickness: 2, height: 30.0),
              Expanded(
                child: FutureBuilder(
                  future: blogNetwork.getBlog(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<BlogModel>> snapshot) {
                    if (snapshot.hasData) {
                      List<BlogModel> blogData = snapshot.data;
                      return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: blogData
                            .map((BlogModel blogVar) => Container(
                                height: 80,
                                //   width: 100,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 80,
                                      margin: EdgeInsets.only(
                                          left: 3.0,
                                          top: 3.0,
                                          bottom: 3.0,
                                          right: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                            image: NetworkImage(blogVar.imgUrl),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              blogVar.title,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(width: 5.0),
                                            Icon(
                                              Icons.share,
                                              color: Pendu.color('60E99C'),
                                              size: 20,
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(blogVar.body,
                                              maxLines: 2,
                                              style: TextStyle(fontSize: 12)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Read more',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Pendu.color('60E99C'),
                                                  fontStyle: FontStyle.italic),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )))
                            .toList(),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
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
