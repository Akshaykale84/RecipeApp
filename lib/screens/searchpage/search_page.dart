import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : food;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
