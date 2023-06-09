part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class VerifyPhone extends AuthEvent {
  final String phone;

  const VerifyPhone(
    this.phone,
  );
  @override
  List<Object> get props => [
        phone,
      ];
}

class VerifyOTP extends AuthEvent {
  final String smsCode;
  const VerifyOTP(
    this.smsCode,
  );
  @override
  List<Object> get props => [
        smsCode,
      ];
}

class SaveUserInformation extends AuthEvent {
  final String name;
  final String email;
  final String address;


  const SaveUserInformation(this.name, this.email, this.address, );
  @override
  List<Object> get props => [
        name,
        email,
        address,
      ];
}

class GetImageUrl extends AuthEvent {
  @override
  List<Object> get props => [];
}
