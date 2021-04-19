class BlogModel {
  final String imgUrl;
  final String title;
  final String body;
  final String url;

  BlogModel({this.imgUrl, this.title, this.body, this.url});
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      imgUrl: json['imgUrl'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      url: json['url'] as String,
    );
  }
}
