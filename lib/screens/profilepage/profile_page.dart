import 'package:flutter/material.dart';
import 'package:RecipeApp/screens/profilepage/profile_export.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Display Name",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                child: Center(
                  child: Text(
                    "emailaddress@gmail.com",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ProfileButton(
                      icon: Icons.add,
                      data: "First Button",
                      tap: () {},
                    ),
                    ProfileButton(
                      icon: Icons.search,
                      data: "Second Button",
                      tap: () => print("hhh"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

