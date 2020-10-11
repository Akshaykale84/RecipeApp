import 'package:flutter/material.dart';

class DesertList extends StatelessWidget {
   DesertList({
    Key key,
    @required this.list,
    @required this.context,
  }) : super(key: key);

  final List<Color> list;
  final BuildContext context;
  static bool isDesertLeft = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(1, 0, 1, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      margin: EdgeInsets.all(5.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deserts",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              //physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: true
                      ? buildDesertRowLeft(index)
                      : buildDesertRowRight(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row buildDesertRowLeft(int index) {
    isDesertLeft = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: list[index],
          ),
          height: 150,
          width: 150,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 150,
          width: 150,
        ),
      ],
    );
  }

  Row buildDesertRowRight(int index) {
    isDesertLeft = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 150,
          width: 150,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: list[index],
          ),
          height: 150,
          width: 150,
        ),
      ],
    );
  }
}
