import 'package:RecipeApp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();
final FacebookLogin fbLogin = new FacebookLogin();
UserCredential user;

Future<UserData> signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuthentication =
      await googleSignInAccount.authentication;
  GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuthentication.accessToken,
    idToken: googleAuthentication.idToken,
  );

  user = await _auth.signInWithCredential(credential);
  UserData userData = UserData(
      name: user.user.displayName,
      emailId: user.user.email,
      uid: user.user.uid,
      photoUrl: user.user.photoURL);
  return userData;
}

Future<UserData> signInWithFacebook() async {
  final FacebookLoginResult result =
      await fbLogin.logIn(['email', 'public_profile']);
  final FacebookAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken.token);
  user = await _auth.signInWithCredential(facebookAuthCredential);
  UserData userData = UserData(
      name: user.user.displayName,
      emailId: user.user.email,
      uid: user.user.uid,
      photoUrl: user.user.photoURL);
  return userData;
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
