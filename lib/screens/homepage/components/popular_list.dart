import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularList extends StatefulWidget {
  PopularList({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<Color> list;

  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList>
    with AutomaticKeepAliveClientMixin {
  final List images = [
    "https://i.ibb.co/1bVVWtK/alex-munsell-Yr4n8-O-3-UPc-unsplash.jpg",
    "https://i.ibb.co/Gdy6JBr/eiliv-sonas-aceron-Zu-IDLSz3-XLg-unsplash.jpg",
    "https://i.ibb.co/V2LYwVs/joseph-gonzalez-fdl-ZBWIP0a-M-unsplash.jpg",
    "https://i.ibb.co/94FxSMw/anna-pelzer-IGf-IGP5-ONV0-unsplash.jpg",
    "https://i.ibb.co/KrL4dJB/joseph-gonzalez-zc-Ugjyq-Ewe8-unsplash.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.fromLTRB(1, 0, 1, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      margin: EdgeInsets.all(5.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Popular Recipes",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            height: 120.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // image: DecorationImage(
                        //   image: NetworkImage(images[index]),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => placeholder(),
                      ),
                    ),
                    Container(
                      height: 15,
                      child: Text(
                        'recipes $index',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
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
