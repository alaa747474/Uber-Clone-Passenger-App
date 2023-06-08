import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> verifyPhone(
      {required String phone,
      required void Function(PhoneAuthCredential) completed,
      required void Function(FirebaseAuthException) failed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout});
  Future<void> verifyOTP(
      {required String smsCode, required String verificationId});
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final FirebaseAuth _auth;
  AuthRemoteDataSource(this._auth);

  @override
  Future<void> verifyOTP(
      {required String smsCode, required String verificationId}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> verifyPhone(
      {required String phone,
      required void Function(PhoneAuthCredential credential) completed,
      required void Function(FirebaseAuthException exception) failed,
      required void Function(String verificationId, int? forceRsendingToken) codeSent,
      required void Function(String verificationId) codeAutoRetrievalTimeout}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: completed,
        verificationFailed: failed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
