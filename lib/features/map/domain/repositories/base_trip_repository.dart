import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/core/errors/failures.dart';

import '../entities/place_direction_entity.dart';
import '../entities/place_entity.dart';
import '../entities/place_prediction_entity.dart';


abstract class BaseMapRepository {
  Future<Either<Failure, List<PlacePredictionEntity>>> getPlaceSuggestions(
      String place);
  Future<Either<Failure, PlaceEntity>> getPlaceDetails(String placeId);
  Future<Either<Failure,PlaceDirectionsEntity>>getPlaceDirections(LatLng origin, LatLng destination);
}
