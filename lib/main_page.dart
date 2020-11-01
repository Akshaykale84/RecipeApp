import 'package:RecipeApp/screens/categorypage/category_page.dart';
import 'package:RecipeApp/screens/homepage/home_page.dart';
import 'package:RecipeApp/screens/profilepage/profile_page.dart';
import 'package:RecipeApp/screens/searchpage/search_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomePage(),
    SearchPage(),
    CategoryPage(),
    ProfilePage(),
  ];
  void _onPageChanged(int index) {}

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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 50,
      //   animationDuration: Duration(milliseconds: 500),
      //   onTap: _itemTapped,
      //   items: [
      //     Icon(
      //       Icons.home,
      //       color: Colors.black,
      //     ),
      //     Icon(
      //       Icons.search,
      //       color: Colors.black,
      //     ),
      //     Icon(
      //       Icons.category,
      //       color: Colors.black,
      //     ),
      //     Icon(
      //       Icons.person,
      //       color: Colors.black,
      //     ),

      //   ],
      // ),
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
