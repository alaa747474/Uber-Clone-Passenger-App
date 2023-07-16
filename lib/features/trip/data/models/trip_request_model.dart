import 'package:uber_clone/features/trip/domain/entities/trip_request_entity.dart';

class TripRequestModel extends TripRequestEntity {
  const TripRequestModel(
      super.currentLatitude,
      super.currentLongitude,
      super.destinationLatitude,
      super.destinationLongitude,
      super.createdAt,
      super.passengerName,
      super.passengerPhone,
      super.currentPlaceName,
      super.destinationPlaceName,
      super.vehicleType);
  Map<String, dynamic> toJson() => {
        'currentLatitude': currentLatitude,
        'currentLongitude': super.currentLongitude,
        'destinationLatitude': destinationLatitude,
        'destinationLongitude': destinationLongitude,
        'createdAt': createdAt,
        'passengerName': passengerName,
        'passengerPhone': passengerPhone,
        'currentPlaceName': currentPlaceName,
        'destinationPlaceName': destinationPlaceName,
        'vehicleType':vehicleType
      };
}
