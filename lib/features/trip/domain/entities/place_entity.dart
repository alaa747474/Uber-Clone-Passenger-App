import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  final String name;
  final double lat;
  final double long;

  const PlaceEntity(this.name, this.lat, this.long);
  @override
  List<Object?> get props => [name, lat, long];
}
