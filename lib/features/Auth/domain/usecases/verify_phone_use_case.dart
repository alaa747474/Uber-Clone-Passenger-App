import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';

class VerifyPhoneUseCase extends UseCase<void, VerifyPhoneParams> {
  final BaseAuthRepository _baseAuthRepository;

  VerifyPhoneUseCase(this._baseAuthRepository);
  @override
  Future<void> call(VerifyPhoneParams params) async {
    _baseAuthRepository.verifyPhone(
        phone: params.phone,
        completed: params.completed,
        failed: params.failed,
        codeSent: params.codeSent,
        codeAutoRetrievalTimeout: params.codeAutoRetrievalTimeout);
  }
}

class VerifyPhoneParams extends Equatable {
  final String phone;
  final void Function(PhoneAuthCredential)? completed;
  final void Function(FirebaseAuthException)? failed;
  final void Function(String, int?)? codeSent;
  final void Function(String)? codeAutoRetrievalTimeout;

  const VerifyPhoneParams(this.phone, this.completed, this.failed,
      this.codeSent, this.codeAutoRetrievalTimeout);

  @override
  List<Object?> get props =>
      [phone, completed, failed, codeSent, codeAutoRetrievalTimeout];
}
