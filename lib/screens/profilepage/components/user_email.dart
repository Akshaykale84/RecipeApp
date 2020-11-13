import 'package:RecipeApp/models/user.dart';
import 'package:flutter/material.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "${userData.emailId}",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

