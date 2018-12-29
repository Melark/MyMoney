import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class _AuthProvider {
  // TODO: AUthProvider
  /*
    [ ] Add Google Auth
    [ ] Add Auth with Github
    [ ] Find some way to link those accounts together so that no matter what method you use to sign in, you will have the same data
   */
  FirebaseUser _user;
  FirebaseUser get user => _user;

  signinWithGoogle() async {
    GoogleSignInAccount googleSigninUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSigninAuthentication =
        await googleSigninUser.authentication;

    FirebaseUser user = await FirebaseAuth.instance.signInWithGoogle(
        idToken: googleSigninAuthentication.idToken,
        accessToken: googleSigninAuthentication.accessToken);

    _user = user;

    return user.uid;
  }

  signInWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    _user = user;

    return user.uid;
  }

  registerWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    _user = user;

    return user.uid;
  }
}

class AuthProvider {
  static _AuthProvider _instance;

  _AuthProvider get instance {
    if (_instance == null) {
      _instance = _AuthProvider();
    }
    return _instance;
  }
}
