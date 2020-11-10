import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

 signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuthentication =
      await googleSignInAccount.authentication;
  GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuthentication.accessToken,
    idToken: googleAuthentication.idToken,
  );
  
    UserCredential user = await _auth.signInWithCredential(credential);
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
  await _auth.signOut();
}
