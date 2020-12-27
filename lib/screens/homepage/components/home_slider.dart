import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<Color> list;
  final List images = [
    "https://i.ibb.co/1bVVWtK/alex-munsell-Yr4n8-O-3-UPc-unsplash.jpg",
    "https://i.ibb.co/Gdy6JBr/eiliv-sonas-aceron-Zu-IDLSz3-XLg-unsplash.jpg",
    "https://i.ibb.co/V2LYwVs/joseph-gonzalez-fdl-ZBWIP0a-M-unsplash.jpg",
    "https://i.ibb.co/94FxSMw/anna-pelzer-IGf-IGP5-ONV0-unsplash.jpg",
    "https://i.ibb.co/KrL4dJB/joseph-gonzalez-zc-Ugjyq-Ewe8-unsplash.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 155.0,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 6),
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: [
        SliderItem(image: images[0]),
        SliderItem(image: images[1]),
        SliderItem(image: images[2]),
        SliderItem(image: images[3]),
        SliderItem(image: images[4]),
      ],
    );
  }
}

class SliderItem extends StatefulWidget {
  const SliderItem({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  _SliderItemState createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: CachedNetworkImage(
        imageUrl: widget.image,
        fit: BoxFit.cover,
        placeholder: (context, url) => placeholder(),
      ),
    );
  }

  Widget placeholder() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
