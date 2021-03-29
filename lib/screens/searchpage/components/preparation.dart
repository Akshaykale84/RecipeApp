import 'package:flutter/material.dart';

class Preparation extends StatelessWidget {
  const Preparation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
              bottom: 10.0,
              top: 5,
            ),
            child: Text(
              "Preparation",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            // color: Colors.blue,
            child: Text(
              "step-by-step preparation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
