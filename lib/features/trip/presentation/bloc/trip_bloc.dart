import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/features/map/presentation/blocs/map_bloc/map_bloc.dart';
import 'package:uber_clone/features/trip/domain/entities/trip_request_entity.dart';
import 'package:uber_clone/features/trip/domain/usecases/save_trip_requests_use_case.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final MapBloc mapBloc;
  final SaveTripRequestsUseCase _saveTripRequestsUseCase;
  TripBloc(
    this.mapBloc,
    this._saveTripRequestsUseCase,
  ) : super(const TripState()) {
    on<CalculateFare>(_calculateFare);
    on<SaveTripRequests>(_saveTripRequests);
  }
  void _calculateFare(CalculateFare event, Emitter emit) {
    double distanceFare = mapBloc.state.placeDirections!.distanceValue / 1000;
    double durationFare = mapBloc.state.placeDirections!.durationValue / 60;
    double totalFare = (distanceFare + durationFare) * 14 / 100;
    if (mapBloc.state.placeDirections == null) {
      emit(state.copyWith(
          bikeTotalFare: 0, standardTotalFare: 0, vipTotalFare: 0));
    } else {
      emit(state.copyWith(
          bikeTotalFare: totalFare * 1.2.truncate(),
          standardTotalFare: totalFare * 1.6,
          vipTotalFare: totalFare * 2));
    }
  }

  void _saveTripRequests(SaveTripRequests event, Emitter emit) async {
    TripRequestEntity params = TripRequestEntity(
      mapBloc.state.position!.latitude,
      mapBloc.state.position!.longitude,
      mapBloc.state.placeDetails!.lat,
      mapBloc.state.placeDetails!.long,
      DateTime.now(),
      currentUser.displayName!,
      currentUser.phoneNumber.toString(),
      mapBloc.state.placeMarks!.first.locality!,
      mapBloc.state.placeDetails!.name,
      event.vehicleType,
    );
    _saveTripRequestsUseCase.call(params);
    emit(state.copyWith(tripRequestState: RequestState.loading));
  }
}
