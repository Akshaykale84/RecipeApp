import 'package:RecipeApp/screens/homepage/home_export.dart';
import 'package:RecipeApp/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: null,
        elevation: 0.0,
        backgroundColor: Color(0xfffe9721),
        title: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff161d27),
          ),
          // child: Center(),
        ),
        centerTitle: true,
      ),
      body: Body(),
      
    );
  }

  @override
  bool get wantKeepAlive => true;
}
