import 'package:flutter/material.dart';
import 'package:pendu_customer/api/api_manipulation.dart';
import 'package:pendu_customer/models/response_post_model.dart';
import 'package:pendu_customer/network_data/blog_network.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class OurBlog extends StatefulWidget {
  final String token;

  OurBlog(this.token);

  @override
  _OurBlogState createState() => _OurBlogState(token);
}

class _OurBlogState extends State<OurBlog> {
  final String token;

  _OurBlogState(this.token);

  final BlogNetwork blogNetwork = BlogNetwork();

  Future buildText() {
    return Future.delayed(Duration(seconds: 3), () => print('waiting...'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: FutureBuilder(
          future: ApiManipulation(context).getBlogs(token),
          builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot != null) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                      height: 80,
                      //   width: 100,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 3.0,
                                  top: 3.0,
                                  bottom: 3.0,
                                  right: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn2.momjunction.com/wp-content/uploads/2019/05/How-to-play-chess.jpg"),
                                    //_blogList[index].featuredImage),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Text(
                                          snapshot.data[i].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.share,
                                          color: Pendu.color('60E99C'),
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(snapshot.data[i].body,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 12)),
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
                              ),
                            ),
                          )
                        ],
                      ));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
