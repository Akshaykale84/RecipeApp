import 'package:RecipeApp/screens/searchpage/components/search_result.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {

  const RecipePage({
    @required this.heading
  });
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      appBar: AppBar(
        title: Text("$heading"),
        elevation: 0.0,
        backgroundColor: Color(0xff212121),
      ),
      body: SearchResult(),
    );
  }
}