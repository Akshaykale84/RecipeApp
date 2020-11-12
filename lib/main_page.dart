import 'package:RecipeApp/main_export.dart';
import 'package:RecipeApp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final UserData userData;

  const MainPage({Key key, this.userData}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState(userData);
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final UserData userData;
  PageController _pageController = PageController();

  _MainPageState(this.userData);

  void _itemTapped(int selectedIndex) {
    if (selectedIndex == 1) {
      showSearch(context: context, delegate: SearchBar());
    } else {
      _pageController.jumpToPage(selectedIndex);
      setState(() {
        _index = selectedIndex;
      });
    }
  }

  @override
  void initState() {
    print(FirebaseAuth.instance.currentUser.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(userData: userData),
          SearchPage(userData: userData),
          CategoryPage(userData: userData),
          ProfilePage(userData: userData),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: buildGNavBar(),
    );
  }

  SafeArea buildGNavBar() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: GNav(
          selectedIndex: _index,
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 400),
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: Colors.black,
              iconActiveColor: Colors.blue,
              text: "Home",
              textColor: Colors.black,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              gap: 10,
            ),
            GButton(
              icon: Icons.search,
              iconColor: Colors.black,
              iconActiveColor: Colors.blue,
              text: "Search",
              textColor: Colors.black,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              gap: 10,
            ),
            GButton(
              icon: Icons.category,
              iconColor: Colors.black,
              iconActiveColor: Colors.blue,
              text: "Category",
              textColor: Colors.black,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              gap: 10,
            ),
            GButton(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                height: 25,
                width: 25,
              ),
              iconColor: Colors.black,
              iconActiveColor: Colors.blue,
              text: "Profile",
              textColor: Colors.black,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              gap: 10,
            ),
          ],
          onTabChange: _itemTapped,
        ),
      ),
    );
  }
}
