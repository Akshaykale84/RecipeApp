import 'package:RecipeApp/screens/loginpage/components/body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        elevation: 0.0,
        leading: null,
      ),
      body: Body(),
    );
  }
}
