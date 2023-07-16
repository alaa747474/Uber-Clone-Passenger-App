import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber_clone/features/trip/data/models/trip_request_model.dart';

abstract class BaseTirpRemoteDataSource {
  Future<void> saveTripRequests(TripRequestModel tripRequest);
}

class TripRemoteDataSource implements BaseTirpRemoteDataSource {
  final FirebaseFirestore _firestore;

  TripRemoteDataSource(this._firestore);
  @override
  Future<void> saveTripRequests(TripRequestModel tripRequest) async {
    await _firestore.collection('tripRequests').add(tripRequest.toJson());
  }
}
