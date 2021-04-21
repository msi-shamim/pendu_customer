import 'package:flutter/material.dart';
import 'package:pendu_customer/Model/blog_model.dart';
import 'package:pendu_customer/network_data/blog_network.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class OurBlog extends StatelessWidget {
  final BlogNetwork blogNetwork = BlogNetwork();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: FutureBuilder(
        future: blogNetwork.getBlog(),
        builder:
            (BuildContext context, AsyncSnapshot<List<BlogModel>> snapshot) {
          if (snapshot.hasData) {
            List<BlogModel> blogData = snapshot.data;
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: blogData
                  .map((BlogModel blogVar) => Container(
                      height: 90,
                      width: 100,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            margin: EdgeInsets.only(
                                left: 3.0, top: 3.0, bottom: 3.0, right: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(blogVar.imgUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    blogVar.title,
                                    style: TextStyle(fontSize: 12),
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
                                child: Text(
                                  blogVar.body,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}
