import 'package:equatable/equatable.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';

class VerifyOTPUseCase extends UseCase<void,VerifyOTPParams> {
  final BaseAuthRepository _baseAuthRepository;

  VerifyOTPUseCase(this._baseAuthRepository);
  @override
  Future<void> call(VerifyOTPParams params) async{
    _baseAuthRepository.verifyOTP(smsCode: params.smsCode, verificationId: params.verificationId);
  }
  
}
class VerifyOTPParams extends Equatable {
  final String smsCode;
  final String verificationId;

  const VerifyOTPParams(this.smsCode, this.verificationId);
  @override
  List<Object?> get props => [smsCode,verificationId]; 
}