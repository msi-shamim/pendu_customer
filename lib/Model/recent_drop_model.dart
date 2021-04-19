class RecentDrop {
  final String imgUrl;
  final String title;
  final String product;
  final double price;
  final double ratings;
  RecentDrop({this.imgUrl, this.title, this.product, this.price, this.ratings});

  factory RecentDrop.fromJson(Map<String, dynamic> json) {
    return RecentDrop(
      imgUrl: json['imgUrl'] as String,
      title: json['title'] as String,
      product: json['product'] as String,
      price: json['price'] as double,
      ratings: json['ratings'] as double,
    );
  }
}
