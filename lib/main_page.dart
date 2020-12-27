import 'package:RecipeApp/main_export.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final UserData userData;

  const MainPage({Key key, this.userData}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState(userData);
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  bool onTap = false;
  final UserData userData;
  PageController _pageController = PageController();
  _MainPageState(this.userData);

  void _itemTapped(int selectedIndex) {
    onTap = true;
    _pageController.animateToPage(
      selectedIndex,
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
    setState(() {
      index = selectedIndex;
    });
  }

  void onPageChanged(int currentIndex) {
    if (!onTap) {
      Timer(Duration(milliseconds: 400), () {
        setState(() {
          index = currentIndex;
        });
      });
    } else {
      onTap = false;
    }
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
            extendBody: true,
            body: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _pageController,
              children: <Widget>[
                HomePage(userData: userData),
                SearchPage(userData: userData),
                ProfilePage(userData: userData),
              ],
            ),
            bottomNavigationBar: buildGNavBar(),
          );
        }
        if (result == ConnectivityResult.wifi) {
          return Scaffold(
            extendBody: true,
            body: PageView(
              onPageChanged: (value) {
                onPageChanged(value);
              },
              controller: _pageController,
              children: <Widget>[
                HomePage(userData: userData),
                SearchPage(userData: userData),
                ProfilePage(userData: userData),
              ],
            ),
            bottomNavigationBar: buildGNavBar(),
          );
        }
        if (result == ConnectivityResult.none) {
          return Scaffold(
            body: ErrorPage(
              tap: refresh,
            ),
          );
        }
        return LoadingPage();
      },
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
          selectedIndex: index,
          curve: Curves.bounceIn,
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
              text: "Explore",
              textColor: Colors.black,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              gap: 10,
            ),
            // GButton(
            //   icon: Icons.category,
            //   iconColor: Colors.black,
            //   iconActiveColor: Colors.blue,
            //   text: "Categories",
            //   textColor: Colors.black,
            //   backgroundColor: Colors.purple.withOpacity(0.2),
            //   iconSize: 24,
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            //   gap: 10,
            // ),
            GButton(
              leading: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(userData.photoUrl),
                    fit: BoxFit.fill,
                  ),
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
