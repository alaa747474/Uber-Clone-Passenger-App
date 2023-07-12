part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();

  @override
  List<Object> get props => [];
}

class CalculateFare extends TripEvent {

  final VehicleType vehicleType;
  const CalculateFare( this.vehicleType);
    @override
  List<Object> get props => [vehicleType];
}
