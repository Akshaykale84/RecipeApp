import 'package:RecipeApp/screens/loginpage/login_page.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({
    Key key,
    @required  this.pageType,
  }) :  super(key: key);

  final PageType pageType;

  @override
  Widget build(BuildContext context) {
    if (pageType == PageType.login) {
      return FlatButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              color: Color(0xfffe9721),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          print("Forget Password");
        },
      );
    } else {
      return SizedBox(
        height: 4,
      );
    }
  }
}
