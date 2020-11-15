import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 38,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
