import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/features/trip/domain/usecases/get_place_suggestions_use_case.dart';
import '../../../../../core/helpers/location_helper.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/place_prediction_entity.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final GetPlaceSuggestionsUseCase _getPlaceSuggestionsUseCase;
  final Completer<GoogleMapController> controller = Completer();
  late GoogleMapController googleMapController;
  MapBloc(this._getPlaceSuggestionsUseCase) : super(const MapState()) {
    on<GetCurrentPosition>(_getCurrentPosition);
    on<GetPlaceMarks>(_getPlaceMarks);
    on<GetPlaceSuggestions>(_getPlaceSuggestions);
  }

  void _getCurrentPosition(GetCurrentPosition event, Emitter emit) async {
    await LocationHelper.instance.getCurrentPosition().then((position) {
      emit(state.copyWith(
          currentLocationState: RequestState.loaded, position: position));
    });
  }

  void _getPlaceMarks(GetPlaceMarks event, Emitter emit) async {
    await placemarkFromCoordinates(
            state.position!.latitude, state.position!.longitude)
        .then((placeMarks) {
      emit(state.copyWith(placeMarks: placeMarks));
    });
  }

  void _getPlaceSuggestions(GetPlaceSuggestions event, Emitter emit) async {
    emit(state.copyWith(placeSuggestionsState: RequestState.loading));
    final result = await _getPlaceSuggestionsUseCase.call(event.placeName);
    result.fold((erorr) {
      emit(state.copyWith(
          error: erorr.errorMessage,
          placeSuggestionsState: RequestState.failed));
    }, (placeSuggestions) {
      emit(state.copyWith(
          placeSuggestions: placeSuggestions,
          placeSuggestionsState: RequestState.loaded));
    });
  }
}
