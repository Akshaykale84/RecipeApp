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
  void pagechange() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Text("search"),
      ),
      body: Container(
        child: Center(
          child: Text("Search Page!"),
        ),
      ),
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
