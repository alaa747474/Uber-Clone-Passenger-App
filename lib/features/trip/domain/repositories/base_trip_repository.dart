import '../entities/trip_request_entity.dart';

abstract class BaseTripRepository {
  Future<void>saveTripRequests(TripRequestEntity tripRequest);
}