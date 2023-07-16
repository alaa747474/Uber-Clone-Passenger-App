import 'package:equatable/equatable.dart';

class TripRequestEntity extends Equatable {
  final double currentLatitude;
  final double currentLongitude;
  final double destinationLatitude;
  final double destinationLongitude;
  final DateTime createdAt;
  final String passengerName;
  final String passengerPhone;
  final String currentPlaceName;
  final String destinationPlaceName;
  final String vehicleType;
  const TripRequestEntity(
    this.currentLatitude,
    this.currentLongitude,
    this.destinationLatitude,
    this.destinationLongitude,
    this.createdAt,
    this.passengerName,
    this.passengerPhone,
    this.currentPlaceName,
    this.destinationPlaceName,
    this.vehicleType
  );
  @override
  List<Object?> get props => [
        currentLatitude,
        currentLongitude,
        destinationLatitude,
        destinationLongitude,
        createdAt,
        passengerName,
        passengerPhone,
        currentPlaceName,
        destinationPlaceName,
        vehicleType
      ];
}
