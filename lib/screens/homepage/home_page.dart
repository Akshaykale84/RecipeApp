import 'package:RecipeApp/screens/homepage/home_export.dart';
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
  bool isConnected = false;
  bool isChecked = false;
  _HomePageState(this.userData);
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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _check,
      builder: (context, snapshot) {
        if (result == ConnectivityResult.wifi) {
          return Scaffold(
            body: Body(
              userData: userData,
            ),
          );
        }
        if (result == ConnectivityResult.mobile) {
          return Scaffold(
            body: Body(
              userData: userData,
            ),
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
