import 'package:RecipeApp/screens/loginpage/login_export.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum PageType { login, register }

class _LoginPageState extends State<LoginPage> {
  var email;

  var pass;

  void login() {
    print("login function");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff161d27).withOpacity(0.9),
                  Color(0xff161d27),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
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
                  height: MediaQuery.of(context).size.height * 0.013,
                ),
                Text(
                  "Time to cook, let's Sign In",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.026,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: login,
                    icon: Container(
                      margin: EdgeInsets.only(
                        right: 5,
                      ),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    label: Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: Color(0xff1877F2),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.026,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: login,
                    icon: Container(
                      margin: EdgeInsets.only(right: 5),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    label: Text(
                      "Sign in with Facebook",
                      style: TextStyle(
                        color: Color(0xff1877F2),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
