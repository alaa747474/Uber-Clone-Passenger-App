import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uber_clone/core/errors/failures.dart';
import 'package:uber_clone/core/errors/server_error.dart';
import 'package:uber_clone/features/trip/data/datasources/trip_remote_data_source.dart';
import 'package:uber_clone/features/trip/domain/entities/place_prediction_entity.dart';
import 'package:uber_clone/features/trip/domain/repositories/base_trip_repository.dart';

class TripRepository implements BaseTripRepository {
  final TripRemoteDataSource _remoteDataSource;

  TripRepository(this._remoteDataSource);
  @override
  Future<Either<Failure, List<PlacePredictionEntity>>> getPlaceSuggestions(
      String place) async {
    final result = await _remoteDataSource.getPlaceSuggestions(place);
    try {
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
