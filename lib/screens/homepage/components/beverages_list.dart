import 'package:flutter/material.dart';

class BeveragesList extends StatelessWidget {
  const BeveragesList({
    Key key,
    @required this.list,
    @required this.context,
  }) : super(key: key);

  final List<Color> list;
  final BuildContext context;

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
                  "Beverages",
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
            height: 170.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 130.0,
                      width: 100.0,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: list[index],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        "${list[index].toString()}",
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.clip,
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
}