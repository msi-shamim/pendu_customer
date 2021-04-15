import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class Blog {
  final String imgurl;
  final String title;
  final String body;
  final String url;

  Blog({this.imgurl, this.title, this.body, this.url});
}

List<Blog> _blogList = [
  Blog(
    imgurl:
        'https://cdn2.momjunction.com/wp-content/uploads/2019/05/How-to-play-chess.jpg',
    title: 'This Week in Chess Magazine...',
    body:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
    url: null,
  ),
  Blog(
    imgurl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzTCfT7tg1edJrv939tGPWHVmSHysGBR4nag&usqp=CAU',
    title: 'This Week in Chess Magazine...',
    body:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
    url: null,
  ),
  Blog(
    imgurl:
        'https://cdn.techexplorist.com/wp-content/uploads/2018/01/chess-player.jpg',
    title: 'This Week in Chess Magazine...',
    body:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
    url: null,
  ),
  Blog(
    imgurl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT29X1bNlQkWU3fM6kgoJ09uIDxGgc3fh6p6Q&usqp=CAU',
    title: 'This Week in Chess Magazine...',
    body:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
    url: null,
  ),
];

class OurBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _blogList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 90,
              width: 100,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
                          image: NetworkImage(_blogList[index].imgurl),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _blogList[index].title,
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
                          _blogList[index].body,
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
              ));
        },
      ),
    );
  }
}
