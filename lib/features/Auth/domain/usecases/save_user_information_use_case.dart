import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/Auth/data/models/user_model.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';

class SaveUserInformationUseCase extends UseCase<void, UserModel> {
  final BaseAuthRepository _baseAuthRepository;

  SaveUserInformationUseCase(this._baseAuthRepository);
  @override
  Future<void> call(UserModel params) async {
    await _baseAuthRepository.saveUserInfromation(userModel: params);
  }
}
