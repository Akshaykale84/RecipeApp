import 'package:RecipeApp/screens/profilepage/profile_export.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ProfileButton(
            icon: Icons.account_circle_outlined,
            data: "Account Settings",
            tap: () {},
          ),
          ProfileButton(
            icon: Icons.favorite_border_outlined,
            data: "Liked Recipes",
            tap: () => print("hhh"),
          ),
          ProfileButton(
            icon: Icons.download_outlined,
            data: "Downloaded Recipes",
            tap: () {},
          ),
          ProfileButton(
            icon: Icons.feedback_outlined,
            data: "Feedback",
            tap: () {},
          ),
          ProfileButton(
            icon: Icons.logout,
            data: "Logout",
            tap: () => signOutUser().whenComplete(
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
