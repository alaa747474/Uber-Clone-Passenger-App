part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class PhoneNumberSubmited extends AuthState {}

class OTPVerified extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;

  const AuthFailure(this.errorMessage);
    @override
  List<Object> get props => [errorMessage];
}
class UserInformationSaved extends AuthState {
  
}
class ProfilePicLoaded extends AuthState {
  
}
class InitialRouteScreenLoaded extends AuthState  {
  final Widget screen;

 const InitialRouteScreenLoaded(this.screen);
 @override
  List<Object> get props => [screen];
}