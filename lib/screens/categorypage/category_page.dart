import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin{

  List<String> cat =['Maharashtra', 'Punjab', 'Spain', 'Italy'];

  @override
  void initState() {
    super.initState();
    print("category");
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(child: Center(child: Text("CategoryPage"),)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}