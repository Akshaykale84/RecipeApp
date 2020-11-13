import 'package:RecipeApp/screens/homepage/home_export.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key key, this.userData}) : super(key: key);
  final UserData userData;
  final List<Color> list = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff212121),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome ${userData.name},",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
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
      ),
    );
  }
}
