import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';

class GetImageUrlUseCase extends UseCase<String, String> {
  final BaseAuthRepository _baseAuthRepository;

  GetImageUrlUseCase(this._baseAuthRepository);
  @override
  Future<String> call(String params) {
    return _baseAuthRepository.getImageUrl(params);
  }
}
