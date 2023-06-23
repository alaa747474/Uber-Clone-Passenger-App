import 'package:dio/dio.dart';
import 'package:uber_clone/core/constants/app_end_points.dart';
import 'package:uber_clone/core/service/api_helper.dart';
import 'package:uber_clone/features/trip/data/models/place_prediction_model.dart';
import 'package:uuid/uuid.dart';

abstract class TripRemoteDataSource {
  Future<List<PlacePredictionModel>> getPlaceSuggestions(String place);
}

class TripRemoteDataSourceImpl implements TripRemoteDataSource {
  final DioHelper _dioHelper;

  TripRemoteDataSourceImpl(this._dioHelper);
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
}
