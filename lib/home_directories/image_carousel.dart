import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class ImageCarousel extends StatefulWidget{
  List<String> _images;
   
  ImageCarousel(this._images);

  @override
  State<StatefulWidget> createState() => _ImageCarouselState(_images);

}

class _ImageCarouselState extends State<ImageCarousel>{
  List<String> _list;

  _ImageCarouselState(this._list);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 120.0,
          initialPage: 0,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        items: _list
            .map((e) => Builder(
            builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Image.asset(e),
            )))
            .toList(),
      ),
    );
  }
}