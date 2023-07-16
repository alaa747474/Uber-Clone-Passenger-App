part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();

  @override
  List<Object> get props => [];
}

class CalculateFare extends TripEvent {
    @override
  List<Object> get props => [];
}
class SaveTripRequests extends TripEvent {
  final String vehicleType;

  const SaveTripRequests(this.vehicleType);
    @override
  List<Object> get props => [vehicleType];
}
