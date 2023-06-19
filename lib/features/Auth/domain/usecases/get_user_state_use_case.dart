import 'package:firebase_auth/firebase_auth.dart';
import 'package:uber_clone/core/usecase/usecase.dart';

import '../repositories/base_auth_repository.dart';

class GetUserStateUseCase extends UseCase<Stream<User?>, NoParams> {
  final BaseAuthRepository _baseAuthRepository;

  GetUserStateUseCase(this._baseAuthRepository);
  @override
  Stream<User?> call(NoParams params) {
    return _baseAuthRepository.getUserState();
  }
}
