import 'package:RecipeApp/screens/loginpage/login_export.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void googleLogin() {
    signInWithGoogle().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(
            userData: value,
          ),
        ),
      );
    }).catchError((e) {
      print(e);
    });
  }

  void facebookLogin() {
    signInWithFacebook().then((value) {
      print(value.name);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    }).catchError((e) {
      print(e.code);
      if (e.code == "account-exists-with-different-credential") {
        showLoginErrorSnackBar("Email already exists",
            "Account Already Exists with same Email ID!!");
      }
    });
  }

  Flushbar showLoginErrorSnackBar(String title, String message) {
    return Flushbar(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade900, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: "$title",
      message: "$message",
      icon: Icon(
        Icons.error_outline,
        size: 30,
        color: Colors.red.shade900,
      ),
      duration: Duration(seconds: 5),
    )..show(context);
  }

  var result;
  check() async {
    result = await Connectivity().checkConnectivity();
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  void refresh() async {
    result = await Connectivity().checkConnectivity();
    setState(() {});
  }

  Future<ConnectivityResult> _check = Connectivity().checkConnectivity();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _check,
      builder: (context, snapshot) {
        if (result == ConnectivityResult.mobile) {
          return Scaffold(
            body: Body(
              googleLogin: googleLogin,
              facebookLogin: facebookLogin,
            ),
          );
        }
        if (result == ConnectivityResult.wifi) {
          return Scaffold(
            body: Body(
              googleLogin: googleLogin,
              facebookLogin: facebookLogin,
            ),
          );
        }
        if (result == ConnectivityResult.none) {
          return ErrorPage(
            tap: refresh,
          );
        }
        return LoadingPage();
      },
    );
  }
}
