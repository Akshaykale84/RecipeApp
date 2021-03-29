import 'package:RecipeApp/main_page.dart';
import 'package:RecipeApp/models/user.dart';
import 'package:RecipeApp/screens/loginpage/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserData userData;

    if (_error) {
      return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              child: Text(
                "SomeThingWentWrong!!!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      );
    }
    if (!_initialized) {
      return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userData = UserData(
        emailId: user.email,
        name: user.displayName,
        photoUrl: user.photoURL,
        uid: user.uid,
      );
    }
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: user != null
          ? MainPage(
              userData: userData,
            )
          : LoginPage(),
    );
  }
}
