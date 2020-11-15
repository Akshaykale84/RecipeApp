import 'package:RecipeApp/main_export.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.40,
      child: FlatButton.icon(
        color: Colors.white,
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchBar(),
          );
        },
        icon: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search,
            color: Color(0xff212121),
            size: 30,
          ),
        ),
        label: Text(
          "Search",
          style: TextStyle(
            color: Color(0xff1877F2),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
