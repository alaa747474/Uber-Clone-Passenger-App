import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_otp_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_phone_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final VerifyOTPUseCase _verifyOTPUseCase;
  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final FirebaseAuth _auth;
  late String verificationId;
  AuthBloc(this._verifyOTPUseCase, this._verifyPhoneUseCase, this._auth)
      : super(AuthLoading()) {
    on<VerifyPhone>(_verifyPhone);
    on<VerifyOTP>(_verifyOTP);
  }
  verificationCompleted(PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
  }

  codeSent(String verificationId, int? forceRsendingToken) {
    this.verificationId = verificationId;
  }

  verificationFailed(FirebaseAuthException error) {
    debugPrint(error.message);
  }

  codeAutoRetrievalTimeout(verificationId) {}

  _verifyPhone(VerifyPhone event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    VerifyPhoneParams verifyPhoneParams = VerifyPhoneParams(
        event.phone,
        verificationCompleted,
        verificationFailed,
        codeSent,
        codeAutoRetrievalTimeout);
    try {
      await _verifyPhoneUseCase.call(verifyPhoneParams);
       emit(PhoneNumberSubmited());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  _verifyOTP(VerifyOTP event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    VerifyOTPParams verifyOTPParams =
        VerifyOTPParams(event.smsCode, verificationId);
    try {
      _verifyOTPUseCase.call(verifyOTPParams);
          emit(OTPVerified());
    }on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
