import 'package:RecipeApp/main_export.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
    @required this.userData,
  }) : super(key: key);
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.22,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(userData.photoUrl),
              fit: BoxFit.contain,
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.17,
        ),
      ),
    );
  }
}
