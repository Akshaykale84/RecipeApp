import 'package:RecipeApp/screens/homepage/home_export.dart';
import 'package:RecipeApp/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserData userData;
  HomePage({Key key, this.userData}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(userData);
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final UserData userData;

  _HomePageState(this.userData);
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
      body: Body(userData: userData),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
