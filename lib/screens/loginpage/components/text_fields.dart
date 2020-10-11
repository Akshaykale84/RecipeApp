import 'package:RecipeApp/screens/loginpage/login_page.dart';
import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    Key key,
    @required this.pageType,
    this.demo,
  }) : //_pageType = pageType,
        super(key: key);

  final PageType pageType;
  final String demo;

  @override
  Widget build(BuildContext context) {
    if (pageType == PageType.login) {
      return buildLoginTextFields();
    } else {
      return buildRegisterTextFields();
    }
  }

  Column buildLoginTextFields() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            onChanged: (value) => print(value),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey.shade700),
              filled: true,
              fillColor: Color(0xff161d27).withOpacity(0.9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            obscureText: true,
            onChanged: (value) => print(value),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey.shade700),
              filled: true,
              fillColor: Color(0xff161d27).withOpacity(0.9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildRegisterTextFields() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            onChanged: (value) => print(value),
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: TextStyle(color: Colors.grey.shade700),
              filled: true,
              fillColor: Color(0xff161d27).withOpacity(0.9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            onChanged: (value) => print(value),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey.shade700),
              filled: true,
              fillColor: Color(0xff161d27).withOpacity(0.9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            obscureText: true,
            onChanged: (value) => print(value),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey.shade700),
              filled: true,
              fillColor: Color(0xff161d27).withOpacity(0.9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xfffe9721),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
