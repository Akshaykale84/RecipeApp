import 'package:RecipeApp/screens/searchpage/search_export.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RecipePhoto(),
              RecipeDetails(),
              RecipeInfo(),
              NutritionInfo(),
              Ingredients(),
              Preparation(),
              RelatedRecipes(),
            ],
          ),
        ),
      ),
    );
  }
}



