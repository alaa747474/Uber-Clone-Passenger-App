import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';

class SignOutUseCase extends UseCase<void,NoParams>{
  final BaseAuthRepository _baseAuthRepository;

  SignOutUseCase(this._baseAuthRepository);
  @override
  Future<void> call(NoParams params) {
    return _baseAuthRepository.signOut();
  }
  
}