import 'package:equatable/equatable.dart';

class PlacePredictionEntity extends Equatable {
  final String placeId;
  final String mainText;
  final String secondaryText;
  const PlacePredictionEntity(
      this.placeId, this.mainText, this.secondaryText);
  @override
  List<Object?> get props => [placeId, mainText, secondaryText];
}
