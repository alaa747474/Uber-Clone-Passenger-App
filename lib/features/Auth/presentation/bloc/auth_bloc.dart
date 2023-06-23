import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import '../../../../core/constants/app_routes_name.dart';
import '../../../trip/presentation/screens/home_screen.dart';
import '../../auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final VerifyOTPUseCase _verifyOTPUseCase;
  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final SaveUserInformationUseCase _saveUserInformationUseCase;
  final GetImageUrlUseCase _getImageUrlUseCase;
  final GetUserStateUseCase _getUserStateUseCase;
  final FirebaseAuth _auth;
  late String verificationId;
  String? imageUrl;
  late String initialRoute;
  AuthBloc(
    this._verifyOTPUseCase,
    this._verifyPhoneUseCase,
    this._saveUserInformationUseCase,
    this._getImageUrlUseCase,
    this._getUserStateUseCase,
    this._auth,
  ) : super(AuthLoading()) {
    on<VerifyPhone>(_verifyPhone);
    on<VerifyOTP>(_verifyOTP);
    on<SaveUserInformation>(_saveUserInformation);
    on<GetImageUrl>(_getImageUrl);
    on<GetUserState>(_getUserState);
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
    }  catch (e) {
      if (e is FirebaseAuthException) {
        emit(AuthFailure(e.message!));
      }
      emit(AuthFailure(e.toString()));
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
      emit(ProfilePicLoaded());
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

  void _getUserState(GetUserState event, Emitter<AuthState> emit) async {
    return await emit.forEach(_getUserStateUseCase.call(NoParams()), onData: (user) {
      if (user != null && user.email != null) {
        initialRoute = AppRoutes.homeScreen;
        return const InitialRouteScreenLoaded(HomeScreen());
      } else if (user != null && user.email == null) {
        initialRoute = AppRoutes.registerScreen;
        return const InitialRouteScreenLoaded(RegisterScreen());
      } else {
        initialRoute = AppRoutes.loginScreen;
        return const InitialRouteScreenLoaded(LoginScreen());
      }
    });
  }
}
