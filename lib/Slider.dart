import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhotoSlider extends StatefulWidget {
  @override
  _PhotoSliderState createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  List imageList = ['images/mumbai.png', 'images/chocolate.png'];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Column(children: [
        CarouselSlider(
            options: CarouselOptions(
                height: 170.0,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1.0,
                onPageChanged: (value, a) {
                  setState(() {
                    current = value;
                  });
                }),
            items: [
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('images/mumbai.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('images/chocolate.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.map((url) {
            int index = imageList.indexOf(url);
            return Container(
              width: 10.0,
              height: 4.0,
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: current == index
                      ? Colors.orange //Color.fromRGBO(0, 0, 0, 0.9)
                      : Colors.grey[200] //Color.fromRGBO(0, 0, 0, 0.4),
                  ),
            );
          }).toList(),
        )
      ]);
    }, childCount: 1));
  }
}
