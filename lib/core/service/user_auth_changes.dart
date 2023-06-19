import 'package:firebase_auth/firebase_auth.dart';

class UserAuthState {
  Stream<User?> getUserState() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
