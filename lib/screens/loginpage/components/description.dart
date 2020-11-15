import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Time to cook, let's Sign In",
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 16,
      ),
    );
  }
}
