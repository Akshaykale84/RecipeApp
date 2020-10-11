import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<Color> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 6),
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: list.map((lcolor) {
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.only(bottom: 5.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: lcolor,
              ),
            ),
            onTap: () {
              print(lcolor.toString());
            },
          );
        });
      }).toList(),
    );
  }
}
