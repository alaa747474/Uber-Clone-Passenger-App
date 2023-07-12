import 'package:equatable/equatable.dart';

class PlaceDirectionsEntity extends Equatable {
  final int distanceValue;
  final int durationValue;
  final String distanceText;
  final String durationText;
  final String ploylinePoints;

  const PlaceDirectionsEntity(
    this.distanceValue,
    this.distanceText,
    this.durationValue,
    this.durationText,
    this.ploylinePoints,
  );
  @override
  List<Object?> get props => [
        distanceValue,
        distanceText,
        durationValue,
        durationText,
        ploylinePoints,
      ];
}
