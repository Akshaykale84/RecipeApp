import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum PageType { login, register }

class _LoginPageState extends State<LoginPage> {
  var email;

  var pass;

  var pass1;

  PageType _pageType = PageType.login;

  void switchToRegister() {
    setState(() {
      _pageType = PageType.register;
    });
  }

  void switchToLogin() {
    setState(() {
      _pageType = PageType.login;
    });
  }

  void login() {
    print("login function");
  }

  void register() {
    print("register function");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/food.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              Color(0xff161d27).withOpacity(0.9),
              Color(0xff161d27),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildDescText(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        filled: true,
                        fillColor: Color(0xff161d27).withOpacity(0.9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xfffe9721))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xfffe9721))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      obscureText: true,
                      key: pass1,
                      onChanged: (value) => pass = value,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        filled: true,
                        fillColor: Color(0xff161d27).withOpacity(0.9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xfffe9721))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xfffe9721))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  buildForgotPass(),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: buildSubmitButton(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSwitchText(),
                      SizedBox(
                        width: 0,
                      ),
                      buildSwitchButton(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Text buildDescText() {
    String data;
    if (_pageType == PageType.login) {
      data = "Sign in";
    } else {
      data = "Sign up";
    }
    return Text(
      "Time to cook, let's $data",
      style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
    );
  }

  Text buildSwitchText() {
    String data;
    if (_pageType == PageType.login) {
      data = "It's your first time here?";
    } else {
      data = "Already have an account?";
    }
    return Text(
      "$data",
      style: TextStyle(color: Colors.white),
    );
  }

  FlatButton buildSwitchButton() {
    String data;
    if (_pageType == PageType.login) {
      data = "Sign up";
    } else {
      data = "Sing in";
    }
    return FlatButton(
      child: Text(
        "$data",
        style: TextStyle(color: Color(0xfffe9721), fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        if (_pageType == PageType.login) {
          switchToRegister();
        } else {
          switchToLogin();
        }
      },
    );
  }

  FlatButton buildSubmitButton() {
    String data;
    if (_pageType == PageType.login) {
      data = "SIGN IN";
    } else {
      data = "SIGN UP";
    }
    return FlatButton(
      onPressed: () {
        if (_pageType == PageType.login) {
          login();
        } else {
          register();
        }
      },
      color: Color(0xfffe9721),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "$data",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget buildForgotPass() {
    if (_pageType == PageType.login) {
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
        height: 48,
      );
    }
  }
}
