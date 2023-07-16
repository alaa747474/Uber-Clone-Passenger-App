import 'package:uber_clone/core/usecase/usecase.dart';
import 'package:uber_clone/features/trip/domain/entities/trip_request_entity.dart';
import 'package:uber_clone/features/trip/domain/repositories/base_trip_repository.dart';


class SaveTripRequestsUseCase extends UseCase<Future<void>,TripRequestEntity> {
  final BaseTripRepository _baseTripRepository;

  SaveTripRequestsUseCase(this._baseTripRepository);
  @override
 Future<void> call(TripRequestEntity params)async {
    return await _baseTripRepository.saveTripRequests(params);
  }
  
}

