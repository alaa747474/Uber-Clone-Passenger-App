import 'package:dartz/dartz.dart';
import 'package:uber_clone/core/errors/failures.dart';
import 'package:uber_clone/features/trip/domain/entities/place_prediction_entity.dart';

abstract class BaseTripRepository {
  Future<Either<Failure,List<PlacePredictionEntity>>> getPlaceSuggestions(String place);
}
