import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    print("profile");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text("Profile Page"))),
    );
  }
}