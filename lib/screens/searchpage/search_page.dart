import 'package:RecipeApp/screens/searchpage/search_export.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final UserData userData;
  const SearchPage({Key key, this.userData}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState(userData);
}

class _SearchPageState extends State<SearchPage> {
  final UserData userData;

  _SearchPageState(this.userData);
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
            backgroundColor: Color(0xff212121),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  SearchTitle(),
                  SearchButton(),
                  RecentRecipes(),
                ],
              ),
            ),
          );
        }
        if (result == ConnectivityResult.wifi) {
          return Scaffold(
            backgroundColor: Color(0xff212121),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  SearchTitle(),
                  SearchButton(),
                  RecentRecipes(),
                ],
              ),
            ),
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
}

class SearchBar extends SearchDelegate<String> {
  final List food = [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eight",
    "nine",
    "ten",
  ];
  final recentCities = [
    "third",
    "fourth",
    "fifth",
    "sixth",
  ];

  String searchResult;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : food;
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          searchResult = suggestionList[index];
          showResults(context);
          query = "";
          print(searchResult);
        },
      ),
    );
  }
}
