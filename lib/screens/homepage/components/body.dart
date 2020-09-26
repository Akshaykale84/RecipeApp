import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);

  static bool isDesertLeft = true;

  final List<Color> list = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/food.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome USERNAME,",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                onSubmitted: (value) {
                  print("$value");
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  hintText: "Search recipes",
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  filled: true,
                  fillColor: Color(0xff161d27).withOpacity(0.9),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color(0xfffe9721),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.05,
              alignment: Alignment.centerLeft,
              child: Text(
                "Recently added",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            buildHomeSlider(),
            buildPopularList(context),
            buildLowCalorieList(),
            buildBeveragesList(context),
            buildDesertList(context),
          ],
        ),
      ),
    );
  }

  Container buildDesertList(BuildContext context) {
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
                  child: isDesertLeft == true
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

  Container buildBeveragesList(BuildContext context) {
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

  Container buildLowCalorieList() {
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
                  "Low calorie recipes",
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
          //buildPopularList(context),
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: list[index],
                    ),
                  ),
                  title: Text("${list[index].toString()}"),
                  subtitle: Text("Calories"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildPopularList(BuildContext context) {
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
                  "Popular recipes",
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
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100.0,
                  width: 100.0,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: list[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider buildHomeSlider() {
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
