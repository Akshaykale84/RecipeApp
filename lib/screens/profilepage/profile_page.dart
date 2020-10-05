import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void editTap() {

  }

  void likedTap() {

  }

  void downloadTap() {

  }

  void logoutTap() {

  }
  @override
  void initState() {
    super.initState();
    print("profile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7)
        ),
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/food.jpg'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              clipper: GetClipper(),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 0.7, color: Colors.black)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Display Name',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Email Id',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Column(
                    children: <Widget>[
                      buildProfileButtons(context, Icons.edit, "Edit Profile", editTap),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      buildProfileButtons(context, Icons.favorite, "Liked Recipes", likedTap),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      buildProfileButtons(context, Icons.file_download, "Downloaded Recipes", downloadTap),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      buildProfileButtons(context, Icons.exit_to_app, "Log Out", logoutTap),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildProfileButtons(BuildContext context, IconData icon, String data, Function tap) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue.withOpacity(0.5),
          border: Border.all(
            width: 1,
            color: Colors.orange,
            style: BorderStyle.solid
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.black,
              ),
              //SizedBox(width: MediaQuery.of(context).size.width * 0.18,),
              Container(
                width: MediaQuery.of(context).size.width * 0.63,
                alignment: Alignment.center,
                child: Text(
                  '$data',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2.3);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}