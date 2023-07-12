import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/core/errors/failures.dart';
import 'package:uber_clone/core/usecase/usecase.dart';

import '../entities/place_direction_entity.dart';
import '../repositories/base_trip_repository.dart';

class GetPlaceDirectionsUseCase implements UseCase<Future<Either<Failure,PlaceDirectionsEntity>>,GetPlaceDirectionsParams>{
  final BaseMapRepository _baseMapRepository;

  GetPlaceDirectionsUseCase(this._baseMapRepository);
  @override
  Future<Either<Failure, PlaceDirectionsEntity>> call(GetPlaceDirectionsParams params)async { 
    return await _baseMapRepository.getPlaceDirections(params.origin,params.destination);
  }
  
}

class GetPlaceDirectionsParams extends Equatable{
  final LatLng origin;
  final LatLng destination;

 const GetPlaceDirectionsParams(this.origin, this.destination);
 
  @override
  List<Object?> get props => [origin,destination];
}