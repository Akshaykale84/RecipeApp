import 'package:RecipeApp/models/user.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "${userData.name}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

