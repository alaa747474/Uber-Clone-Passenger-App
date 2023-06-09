import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uber_clone/features/Auth/data/models/user_model.dart';
import 'package:uber_clone/features/Auth/domain/usecases/get_image_url_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/save_user_information_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_otp_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_phone_use_case.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final VerifyOTPUseCase _verifyOTPUseCase;
  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final SaveUserInformationUseCase _saveUserInformationUseCase;
  final GetImageUrlUseCase _getImageUrlUseCase;
  final FirebaseAuth _auth;
  late String verificationId;
  String? imageUrl;
  AuthBloc(
    this._verifyOTPUseCase,
    this._verifyPhoneUseCase,
    this._auth,
    this._saveUserInformationUseCase,
    this._getImageUrlUseCase,
  ) : super(AuthLoading()) {
    on<VerifyPhone>(_verifyPhone);
    on<VerifyOTP>(_verifyOTP);
    on<SaveUserInformation>(_saveUserInformation);
    on<GetImageUrl>(_getImageUrl);
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

  void _verifyPhone(VerifyPhone event, Emitter<AuthState> emit) async {
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
      emit(AuthFailure(e.message!));
    }
  }

  void _verifyOTP(VerifyOTP event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    VerifyOTPParams verifyOTPParams =
        VerifyOTPParams(event.smsCode, verificationId);
    try {
      _verifyOTPUseCase.call(verifyOTPParams);
      emit(OTPVerified());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message!));
    }
  }

  void _getImageUrl(GetImageUrl event, Emitter<AuthState> emit) {
    _getImageUrlUseCase.call(_auth.currentUser!.uid).then((value) {
      imageUrl = value;
    });
  }

  void _saveUserInformation(
      SaveUserInformation event, Emitter<AuthState> emit) {
    UserModel userModel = UserModel(
        event.name,
        event.email,
        _auth.currentUser!.uid,
        event.address,
        _auth.currentUser!.phoneNumber.toString(),
        imageUrl!);
    try {
      if (imageUrl != null) {
        _saveUserInformationUseCase.call(userModel);
        emit(UserInformationSaved());
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(AuthFailure(e.message!));
      }
      emit(AuthFailure(e.toString()));
    }
  }
}
