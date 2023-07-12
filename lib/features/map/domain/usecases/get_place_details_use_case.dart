import 'package:dartz/dartz.dart';
import 'package:uber_clone/core/errors/failures.dart';
import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/map/domain/repositories/base_trip_repository.dart';

import '../entities/place_entity.dart';

class GetPlaceDetailsUseCase implements UseCase<Future<Either<Failure,PlaceEntity>>,String> {
  final BaseMapRepository _baseMapRepository;

  GetPlaceDetailsUseCase(this._baseMapRepository);
  @override
  Future<Either<Failure, PlaceEntity>> call(String params) async{
    return await _baseMapRepository.getPlaceDetails(params);
  }
  
}