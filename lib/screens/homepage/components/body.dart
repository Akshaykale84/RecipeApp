import 'package:RecipeApp/screens/homepage/home_export.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);


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
            HomeSlider(list: list),
            PopularList(list: list, context: context),
            LowCaloriesList(list: list),
            BeveragesList(list: list, context: context),
            DesertList(list: list, context: context),
          ],
        ),
      ),
    );
  }
}








