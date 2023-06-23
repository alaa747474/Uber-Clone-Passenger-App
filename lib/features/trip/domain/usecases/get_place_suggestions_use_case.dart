import 'package:dartz/dartz.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/trip/domain/entities/place_prediction_entity.dart';
import 'package:uber_clone/features/trip/domain/repositories/base_trip_repository.dart';

import '../../../../core/errors/failures.dart';

class GetPlaceSuggestionsUseCase implements UseCase<Future<Either<Failure, List<PlacePredictionEntity>>>, String> {
  final BaseTripRepository _baseTripRepository;

  GetPlaceSuggestionsUseCase(this._baseTripRepository);

  @override
  Future<Either<Failure, List<PlacePredictionEntity>>> call(String params) {
    return _baseTripRepository.getPlaceSuggestions(params);
  }
}
