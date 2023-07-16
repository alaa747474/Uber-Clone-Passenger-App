import 'package:uber_clone/features/trip/data/datasources/trip_remote_data_source.dart';
import 'package:uber_clone/features/trip/data/models/trip_request_model.dart';
import 'package:uber_clone/features/trip/domain/entities/trip_request_entity.dart';
import 'package:uber_clone/features/trip/domain/repositories/base_trip_repository.dart';

class TripRepository extends BaseTripRepository {
  final BaseTirpRemoteDataSource _baseTirpRemoteDataSource;

  TripRepository(this._baseTirpRemoteDataSource);

  @override
  Future<void> saveTripRequests(TripRequestEntity tripRequest) async {
    TripRequestModel tripRequestModel = TripRequestModel(
        tripRequest.currentLatitude,
        tripRequest.currentLongitude,
        tripRequest.destinationLatitude,
        tripRequest.destinationLongitude,
        tripRequest.createdAt,
        tripRequest.passengerName,
        tripRequest.passengerPhone,
        tripRequest.currentPlaceName,
        tripRequest.destinationPlaceName,
        tripRequest.vehicleType
        );
    return await _baseTirpRemoteDataSource.saveTripRequests(tripRequestModel);
  }
}
