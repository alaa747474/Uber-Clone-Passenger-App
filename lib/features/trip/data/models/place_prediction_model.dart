import '../../domain/entities/place_prediction_entity.dart';

class PlacePredictionModel extends PlacePredictionEntity {
  const PlacePredictionModel(
    super.placeId,
    super.mainText,
    super.secondaryText,
  );
  factory PlacePredictionModel.forJson(Map<String, dynamic> json) {
    return PlacePredictionModel(
      json['place_id'],
      json['structured_formatting']['main_text'],
      json['structured_formatting']['secondary_text'],
    );
  }
}
