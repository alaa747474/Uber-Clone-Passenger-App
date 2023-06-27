import 'package:uber_clone/features/trip/domain/entities/place_direction_entity.dart';

class PlaceDirectionsModel extends PlaceDirectionsEntity {
  const PlaceDirectionsModel(
    super.distanceValue,
    super.distanceText,
    super.durationValue,
    super.durationText,
    super.ploylinePoints,
  );
  factory PlaceDirectionsModel.formJson(Map<String, dynamic> json) {
    return PlaceDirectionsModel(
      json['legs'][0]['distance']['value'],
      json['legs'][0]['distance']['text'],
      json['legs'][0]['duration']['value'],
      json['legs'][0]['duration']['text'],
      json['overview_polyline']['points'],
    );
  }
}
