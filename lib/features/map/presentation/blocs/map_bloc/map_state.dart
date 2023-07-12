part of 'map_bloc.dart';

class MapState extends Equatable {
  final Position? position;
  final RequestState currentLocationState;
  final List<Placemark>? placeMarks;
  final List<PlacePredictionEntity>? placeSuggestions;
  final RequestState placeSuggestionsState;
  final PlaceEntity? placeDetails;
  final RequestState placeDetailsState;
  final PlaceDirectionsEntity? placeDirections;
  final RequestState placeDirectionsState;
  final RequestState polylineState;
  final String? error;
  const MapState({
    this.position,
    this.currentLocationState = RequestState.loading,
    this.placeMarks,
    this.placeSuggestions,
    this.placeSuggestionsState = RequestState.initial,
    this.placeDetails,
    this.placeDetailsState = RequestState.loading,
    this.placeDirections,
    this.placeDirectionsState = RequestState.loading,
    this.polylineState=RequestState.initial,
    this.error,
  });
  MapState copyWith({
    Position? position,
    RequestState? currentLocationState,
    List<Placemark>? placeMarks,
    List<PlacePredictionEntity>? placeSuggestions,
    RequestState? placeSuggestionsState,
    PlaceEntity? placeDetails,
    RequestState? placeDetailsState,
    PlaceDirectionsEntity? placeDirections,
    RequestState? placeDirectionsState,
    RequestState?polylineState,
    String? error,
  }) {
    return MapState(
      position: position ?? this.position,
      currentLocationState: currentLocationState ?? this.currentLocationState,
      placeMarks: placeMarks ?? this.placeMarks,
      placeSuggestions: placeSuggestions ?? this.placeSuggestions,
      placeSuggestionsState:
      placeSuggestionsState ?? this.placeSuggestionsState,
      placeDetails: placeDetails ?? this.placeDetails,
      placeDetailsState: placeDetailsState ?? this.placeDetailsState,
      placeDirections:
          placeDirections ?? this.placeDirections,
      placeDirectionsState: placeDetailsState ?? this.placeDirectionsState,
      polylineState: polylineState??this.polylineState,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        position,
        currentLocationState,
        placeMarks,
        placeSuggestions,
        placeSuggestionsState,
        placeDetails,
        placeDetailsState,
        placeDirections,
        placeDirectionsState,
        polylineState,
        error,
      ];
}
