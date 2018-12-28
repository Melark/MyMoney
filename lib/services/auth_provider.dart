import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider{
  // TODO: AUthProvider
  /*
    [ ] Add Google Auth
    [ ] Add Auth with Github
    [ ] Find some way to link those accounts together so that no matter what method you use to sign in, you will have the same data
   */


  signInWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  registerWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }
}