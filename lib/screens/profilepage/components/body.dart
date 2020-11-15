import 'package:flutter/material.dart';
import 'package:RecipeApp/screens/profilepage/profile_export.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            ProfilePic(
              userData: userData,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            UserName(userData: userData),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            UserEmail(userData: userData),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Buttons(),
          ],
        ),
      ),
    );
  }
}
