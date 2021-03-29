import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key key,
    this.googleLogin,
  }) : super(key: key);
  final Function googleLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.80,
      child: TextButton.icon(
        // color: Colors.white,
        onPressed: googleLogin,
        icon: Container(
          margin: EdgeInsets.only(
            right: 5,
          ),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png"),
                fit: BoxFit.fill),
          ),
        ),
        label: Text(
          "Sign in with Google",
          style: TextStyle(
            color: Color(0xff1877F2),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30),
        // ),
      ),
    );
  }
}
