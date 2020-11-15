import 'package:RecipeApp/screens/loginpage/login_export.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    this.googleLogin,
    this.facebookLogin,
  }) : super(key: key);
  final Function googleLogin;
  final Function facebookLogin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff212121),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Icon(
                  Icons.food_bank_outlined,
                  color: Colors.white,
                  size: 200,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  WelcomeText(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  Description(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  GoogleButton(
                    googleLogin: googleLogin,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  FacebookButton(
                    facebookLogin: facebookLogin,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
