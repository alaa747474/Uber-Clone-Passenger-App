import 'package:dartz/dartz.dart';
import 'package:uber_clone/core/errors/failures.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/trip/domain/entities/place_entity.dart';
import 'package:uber_clone/features/trip/domain/repositories/base_trip_repository.dart';

class GetPlaceDetailsUseCase implements UseCase<Future<Either<Failure,PlaceEntity>>,String> {
  final BaseTripRepository _baseTripRepository;

  GetPlaceDetailsUseCase(this._baseTripRepository);
  @override
  Future<Either<Failure, PlaceEntity>> call(String params) async{
    return await _baseTripRepository.getPlaceDetails(params);
  }
  
}