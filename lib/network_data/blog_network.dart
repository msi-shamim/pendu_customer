import 'package:pendu_customer/models/blog_model.dart';

class BlogNetwork {
  Future<List<BlogModel>> getBlog() async {
    List<BlogModel> _blogList = [
      BlogModel(
        imgUrl:
            'https://cdn2.momjunction.com/wp-content/uploads/2019/05/How-to-play-chess.jpg',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzTCfT7tg1edJrv939tGPWHVmSHysGBR4nag&usqp=CAU',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://cdn.techexplorist.com/wp-content/uploads/2018/01/chess-player.jpg',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT29X1bNlQkWU3fM6kgoJ09uIDxGgc3fh6p6Q&usqp=CAU',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://cdn2.momjunction.com/wp-content/uploads/2019/05/How-to-play-chess.jpg',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzTCfT7tg1edJrv939tGPWHVmSHysGBR4nag&usqp=CAU',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://cdn.techexplorist.com/wp-content/uploads/2018/01/chess-player.jpg',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
      BlogModel(
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT29X1bNlQkWU3fM6kgoJ09uIDxGgc3fh6p6Q&usqp=CAU',
        title: 'This Week in Chess Magazine...',
        body:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod temporelitr...',
        url: null,
      ),
    ];
    return _blogList;
  }
}
