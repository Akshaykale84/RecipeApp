import 'package:RecipeApp/screens/homepage/components/body.dart';
import 'package:RecipeApp/size_config.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Icon(Icons.adb),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0.5,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.white,
        )
      ],
    );
  }
}
