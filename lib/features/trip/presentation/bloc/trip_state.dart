part of 'trip_bloc.dart';

class TripState extends Equatable {
  final double? bikeTotalFare;
  final double? standardTotalFare;
  final double? vipTotalFare;

TripState  copyWith(
      {double? bikeTotalFare,
      double? standardTotalFare,
      double? vipTotalFare}) {
    return TripState(bikeTotalFare: bikeTotalFare??this.bikeTotalFare,
    standardTotalFare: standardTotalFare??this.standardTotalFare,
    vipTotalFare: vipTotalFare??this.bikeTotalFare
    );
  }

  const TripState({this.bikeTotalFare,this.standardTotalFare,this.vipTotalFare});

  @override
  List<Object?> get props => [bikeTotalFare,standardTotalFare,vipTotalFare];
}
