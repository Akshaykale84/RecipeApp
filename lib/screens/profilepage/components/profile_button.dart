import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    @required this.icon,
    @required this.data,
    @required this.tap,
    Key key,
  }) : super(key: key);
  final IconData icon;
  final String data;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.80,
      child: RaisedButton(
        color: Color(0xff373737),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
          side: BorderSide(color: Colors.blue),
        ),
        child: buildButtonBody(context),
        onPressed: tap,
      ),
    );
  }

  Row buildButtonBody(BuildContext context) {
    return Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  "$data",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ],
      );
  }
}
