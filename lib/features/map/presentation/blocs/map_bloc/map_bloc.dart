import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/features/map/domain/usecases/get_place_directions_use_case.dart';
import 'package:uber_clone/features/map/domain/usecases/get_place_suggestions_use_case.dart';
import '../../../../../core/helpers/location_helper.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/place_direction_entity.dart';
import '../../../domain/entities/place_entity.dart';
import '../../../domain/entities/place_prediction_entity.dart';
import '../../../domain/usecases/get_place_details_use_case.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  Set<Polyline> polylines = <Polyline>{};
  PolylinePoints polylinePoints = PolylinePoints();

  final GetPlaceSuggestionsUseCase _getPlaceSuggestionsUseCase;
  final GetPlaceDetailsUseCase _getPlaceDetailsUseCase;
  final GetPlaceDirectionsUseCase _getPlaceDirectionsUseCase;
  final Completer<GoogleMapController> controller = Completer();
  late GoogleMapController googleMapController;
  List<PointLatLng> decodedPolylinePoints = [];
  bool polyLineIsDrawn = false;
  MapBloc(this._getPlaceSuggestionsUseCase, this._getPlaceDetailsUseCase,
      this._getPlaceDirectionsUseCase)
      : super(const MapState()) {
    on<GetCurrentPosition>(_getCurrentPosition);
    on<GetPlaceMarks>(_getPlaceMarks);
    on<GetPlaceSuggestions>(_getPlaceSuggestions);
    on<GetPlaceDetails>(_getPlaceDetails);
    on<GetPlaceDirections>(_getPlaceDirections);
    on<DrawPolyline>(_drawPolyline);
    on<RemovePolyline>(_removePolyline);
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

  void _getPlaceDetails(GetPlaceDetails event, Emitter emit) async {
    final result = await _getPlaceDetailsUseCase.call(event.placeId);
    result.fold((error) {
      emit(state.copyWith(error: error.errorMessage));
    }, (placeDetails) {
      emit(state.copyWith(
          placeDetails: placeDetails, placeDetailsState: RequestState.loaded));
    });
  }

  void _getPlaceDirections(GetPlaceDirections event, Emitter emit) async {
    LatLng origin = LatLng(state.position!.latitude, state.position!.longitude);
    LatLng destination = event.destination;
    GetPlaceDirectionsParams getPlaceDirectionsParams =
        GetPlaceDirectionsParams(origin, destination);
    final result =
        await _getPlaceDirectionsUseCase.call(getPlaceDirectionsParams);
    result.fold((error) {
      emit(state.copyWith(error: error.errorMessage));
    }, (placeDirections) {
      emit(state.copyWith(
          placeDirections: placeDirections,
          placeDirectionsState: RequestState.loaded));
    });
  }

  void _drawPolyline(DrawPolyline event, Emitter emit) async {
    decodedPolylinePoints =
        polylinePoints.decodePolyline(state.placeDirections!.ploylinePoints);
    polylines.add(Polyline(
        polylineId: const PolylineId('ID'),
        width: 4,
        color: const Color(0xff58BE3F),
        points: decodedPolylinePoints
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList()));

    emit(state.copyWith(polylineState: RequestState.loaded));
  }
  void _removePolyline(RemovePolyline event ,Emitter emit){
    polylines.clear();
    decodedPolylinePoints.clear();
    emit(state.copyWith(polylineState: RequestState.initial));
  }
}
