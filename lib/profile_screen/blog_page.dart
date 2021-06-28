import 'package:flutter/material.dart';
import 'package:pendu_customer/models/response_post_model.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/snackBar_page.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';

class BlogPage extends StatefulWidget {
  final String token;
  BlogPage(this.token);
  @override
  _BlogPageState createState() => _BlogPageState(token);
}

class _BlogPageState extends State<BlogPage> {
  final String token;
  _BlogPageState(this.token);

  String sortVal = 'All';
  int intValue = 0;

  List<Datum> _blogList;

  @override
  void initState() {
    if(token != null){
    _blogList = FetchDataUtils(context).getBlogs(token);
  } else{
      SnackBarClass.snackBarMethod(message: "Something went wrong", context: context);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Future buildText() {
    return Future.delayed(Duration(seconds: 3), () => print('waiting...'));
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldHomeKey = GlobalKey<ScaffoldState>();

    Widget _buildSorting() {
      return Container(
        height: 30,
        width: 110,
        decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('90A0B2')),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(sortVal),
            SizedBox(width: 5),
            PopupMenuButton(
              child: Icon(
                Icons.unfold_more_rounded,
                color: Pendu.color('90A0B2'),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('All'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('This month'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('This year'),
                  value: 2,
                ),
              ],
              initialValue: intValue,
              onSelected: (result) {
                if (result == 0) {
                  setState(() {
                    sortVal = 'All';
                    intValue = 0;
                  });
                } else if (result == 1) {
                  setState(() {
                    sortVal = 'This month';
                    intValue = 1;
                  });
                } else if (result == 2) {
                  setState(() {
                    sortVal = 'This year';
                    intValue = 2;
                  });
                }
              },
            ),
          ],
        ),
      );
    }

    Widget _buildHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sort by',
            style: TextStyle(fontSize: 16, color: Pendu.color('707070')),
          ),
          _buildSorting(),
        ],
      );
    }

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
              _buildHeader(),
              Divider(thickness: 2, height: 30.0),
              Expanded(
                  child: FutureBuilder(
                future: buildText(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      _blogList != null) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _blogList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 80,
                            //   width: 100,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Text(
                                                _blogList[index].title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                          child: Text(_blogList[index].body,
                                              maxLines: 3,
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
                                    ),
                                  ),
                                )
                              ],
                            ));
                      },
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor,
                    ));
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
