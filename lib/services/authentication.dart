import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();
final FacebookLogin fbLogin = new FacebookLogin();
UserCredential user;

Future<User>signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuthentication =
      await googleSignInAccount.authentication;
  GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuthentication.accessToken,
    idToken: googleAuthentication.idToken,
  );

  user = await _auth.signInWithCredential(credential);
  print("user name:${user.user.uid}");
  print("login function");
  print(_auth.currentUser.displayName);

  return user.user;
}

Future<User>signInWithFacebook() async {
  final FacebookLoginResult result = await fbLogin.logIn(['email', 'public_profile']);
  final FacebookAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken.token);
  user = await _auth.signInWithCredential(facebookAuthCredential);
  print("user name:${user.user.uid}");
  print("login function");
  print(_auth.currentUser.displayName);
  return user.user;
}

Future signOutUser() async {
  User user = _auth.currentUser;

  if (user.providerData[0].providerId == "google.com") {
    await googleSignIn.disconnect();
  }
  if (user.providerData[0].providerId == "facebook.com") {
    print("facebook");
    await fbLogin.logOut();
  }
  await _auth.signOut();
}
