import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    Key key,
    this.facebookLogin,
  }) : super(key: key);
  final Function facebookLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.80,
      child: FlatButton.icon(
        color: Colors.white,
        onPressed: facebookLogin,
        icon: Container(
          margin: EdgeInsets.only(right: 5),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                    "https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512"),
                fit: BoxFit.fill),
          ),
        ),
        label: Text(
          "Sign in with Facebook",
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
