part of 'trip_bloc.dart';

class TripState extends Equatable {
  final double? bikeTotalFare;
  final double? standardTotalFare;
  final double? vipTotalFare;
  final RequestState? tripRequestState;

  TripState copyWith({
    double? bikeTotalFare,
    double? standardTotalFare,
    double? vipTotalFare,
    RequestState? tripRequestState,
  }) {
    return TripState(
        bikeTotalFare: bikeTotalFare ?? this.bikeTotalFare,
        standardTotalFare: standardTotalFare ?? this.standardTotalFare,
        vipTotalFare: vipTotalFare ?? this.bikeTotalFare,
        tripRequestState: tripRequestState ?? this.tripRequestState);
  }

  const TripState(
      {this.bikeTotalFare,
      this.standardTotalFare,
      this.vipTotalFare,
      this.tripRequestState = RequestState.initial});

  @override
  List<Object?> get props =>
      [bikeTotalFare, standardTotalFare, vipTotalFare, tripRequestState];
}
