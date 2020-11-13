import 'package:flutter/material.dart';
import 'package:RecipeApp/screens/profilepage/profile_export.dart';

class ProfilePage extends StatefulWidget {
  final UserData userData;

  const ProfilePage({Key key, this.userData}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(userData);
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  _ProfilePageState(this.userData);
  final UserData userData;

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
        if (result == ConnectivityResult.mobile) {
          return Scaffold(
            backgroundColor: Color(0xff212121),
            body: Body(userData: userData),
          );
        }
        if (result == ConnectivityResult.wifi) {
          return Scaffold(
            backgroundColor: Color(0xff212121),
            body: Body(userData: userData),
          );
        }
        if (result == ConnectivityResult.none) {
          return Scaffold(
            body: ErrorPage(
              tap: refresh,
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
