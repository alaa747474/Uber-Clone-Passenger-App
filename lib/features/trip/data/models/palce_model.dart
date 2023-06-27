import 'package:uber_clone/features/trip/domain/entities/place_entity.dart';

class PlaceModel extends PlaceEntity {
  const PlaceModel(super.name, super.lat, super.long);
  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      json['name'],
      json['geometry']['location']['lat'],
      json['geometry']['location']['lng'],
    );
  }
}
