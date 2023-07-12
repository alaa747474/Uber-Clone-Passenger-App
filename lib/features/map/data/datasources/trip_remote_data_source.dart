import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/core/constants/app_end_points.dart';
import 'package:uber_clone/core/service/api_helper.dart';

import 'package:uuid/uuid.dart';

import '../models/palce_model.dart';
import '../models/place_direction_model.dart';
import '../models/place_prediction_model.dart';

abstract class MapRemoteDataSource {
  Future<List<PlacePredictionModel>> getPlaceSuggestions(String place);
  Future<PlaceModel> getPlaceDetails(String placeId);
  Future<PlaceDirectionsModel> getPlaceDirections(
      LatLng origin, LatLng destination);
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final DioHelper _dioHelper;

  MapRemoteDataSourceImpl(this._dioHelper);
  @override
  Future<List<PlacePredictionModel>> getPlaceSuggestions(String place) async {
    Response response = await _dioHelper
        .getData(endPoint: AppEndPosints.placesAutoComplete, queryParameters: {
      'input': place,
      'types': 'address',
      'components': 'country:eg',
      'key': AppEndPosints.mapApiKey,
      'sessiontoken': const Uuid().v4()
    });
    List<dynamic> data = response.data['predictions'];
    return data.map((e) => PlacePredictionModel.forJson(e)).toList();
  }

  @override
  Future<PlaceModel> getPlaceDetails(String placeId) async {
    Response response = await _dioHelper
        .getData(endPoint: AppEndPosints.placeDetails, queryParameters: {
      'place_id': placeId,
      'key': AppEndPosints.mapApiKey,
    });
    return PlaceModel.fromJson(response.data['result']);
  }

  @override
  Future<PlaceDirectionsModel> getPlaceDirections(
      LatLng origin, LatLng destination) async {
    Response response = await _dioHelper
        .getData(endPoint: AppEndPosints.directions, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': AppEndPosints.mapApiKey
    });
    return PlaceDirectionsModel.formJson(response.data['routes'][0]);
  }
}
