import 'package:dartz/dartz.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/map/domain/repositories/base_trip_repository.dart';


import '../../../../core/errors/failures.dart';
import '../entities/place_prediction_entity.dart';

class GetPlaceSuggestionsUseCase implements UseCase<Future<Either<Failure, List<PlacePredictionEntity>>>, String> {
  final BaseMapRepository _baseMapRepository;

  GetPlaceSuggestionsUseCase(this._baseMapRepository);

  @override
  Future<Either<Failure, List<PlacePredictionEntity>>> call(String params) {
    return _baseMapRepository.getPlaceSuggestions(params);
  }
}
