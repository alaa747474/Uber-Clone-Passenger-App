import 'package:firebase_auth/firebase_auth.dart';
import 'package:uber_clone/features/Auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseAuthRemoteDataSource _baseAuthRemoteDataSource;

  AuthRepository(this._baseAuthRemoteDataSource);
  @override
  Future<void> verifyOTP(
      {required String smsCode, required String verificationId}) async {
    await _baseAuthRemoteDataSource.verifyOTP(
        smsCode: smsCode, verificationId: verificationId);
  }

  @override
  Future<void> verifyPhone(
      {required String phone,
      required void Function(PhoneAuthCredential p1)? completed,
      required void Function(FirebaseAuthException p1)? failed,
      required void Function(String p1, int? p2)? codeSent,
      required void Function(String p1)? codeAutoRetrievalTimeout}) async {
    await _baseAuthRemoteDataSource.verifyPhone(
        phone: phone,
        completed: completed!,
        failed: failed!,
        codeSent: codeSent!,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout!);
  }
}
