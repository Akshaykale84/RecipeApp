import 'package:flutter/material.dart';

class NutritionInfo extends StatefulWidget {
  @override
  _NutritionInfoState createState() => _NutritionInfoState();
}

class _NutritionInfoState extends State<NutritionInfo> {
  var _height = 0.0;
  var _margin = 0.0;
  var _data = "Show Info";
  var _icon = Icons.add;
  animate() {
    setState(() {
      _height = _height == 0 ? 200 : 0;
      _margin = _margin == 0.0 ? 8.0 : 0.0;
      _data = _data == "Show Info" ? "Hide Info" : "Show Info";
      _icon = _icon == Icons.add ? Icons.close_rounded : Icons.add;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Nutrition Info",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              FlatButton.icon(
                label: Icon(
                  _icon,
                  color: Colors.blue,
                ),
                icon: Text(
                  "$_data",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onPressed: animate,
              ),
            ],
          ),
        ),
        AnimatedContainer(
          margin: EdgeInsets.all(_margin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.red,
          ),
          height: _height,
          duration: Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
