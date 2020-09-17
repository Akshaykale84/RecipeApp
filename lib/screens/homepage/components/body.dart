import 'package:RecipeApp/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);
  final List<String> data = ["Akshay", "Kale", "PUBGM", "Flutter"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("grid ${data[index]}"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
