import 'package:base_flutter_firebase_login/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //To verify new User
  Future<bool> verifyUser (User userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: userData.email, password: userData.password);
    return true;
  }

}
