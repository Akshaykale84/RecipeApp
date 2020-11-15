import 'package:RecipeApp/screens/categorypage/category_export.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key, this.userData}) : super(key: key);
  final UserData userData;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  var result;

  check() async {
    result = await Connectivity().checkConnectivity();
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  void refresh() async {
    result = await Connectivity().checkConnectivity();
    setState(() {});
  }

  Future<ConnectivityResult> _check = Connectivity().checkConnectivity();

  final List<IconData> icon = [
    Icons.add,
    Icons.home,
    Icons.logout,
    Icons.close,
    Icons.add,
    Icons.home,
    Icons.logout,
    Icons.close,
    Icons.icecream,
    Icons.ac_unit,
    Icons.add,
    Icons.add,
    Icons.access_alarm,
    Icons.icecream,
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _check,
      builder: (context, snapshot) {
        if (result == ConnectivityResult.mobile) {
          return Scaffold(
            extendBody: true,
            backgroundColor: Color(0xff212121),
            body: CategoryGridView(icon: icon),
          );
        }
        if (result == ConnectivityResult.wifi) {
          return Scaffold(
            extendBody: true,
            backgroundColor: Color(0xff212121),
            body: CategoryGridView(icon: icon),
          );
        }
        if (result == ConnectivityResult.none) {
          return Scaffold(
            body: ErrorPage(
              tap: refresh,
            ),
          );
        }
        return LoadingPage();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
