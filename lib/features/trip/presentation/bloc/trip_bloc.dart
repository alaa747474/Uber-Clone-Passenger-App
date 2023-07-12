import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/features/map/presentation/blocs/map_bloc/map_bloc.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final MapBloc mapBloc;
  TripBloc(this.mapBloc) : super(const TripState()) {
    on<CalculateFare>(_calculateFare);
  }
  void _calculateFare(
    CalculateFare event,
    Emitter emit,
  ) {
    double distanceFare = mapBloc.state.placeDirections!.distanceValue / 1000;
    double durationFare = mapBloc.state.placeDirections!.durationValue / 60;
    double totalFare = (distanceFare + durationFare) * 14 / 100;
    emit(state.copyWith(
        bikeTotalFare: totalFare * 1.2.truncate(),
        standardTotalFare: totalFare * 1.6,
        vipTotalFare: totalFare * 2));
  }
}
