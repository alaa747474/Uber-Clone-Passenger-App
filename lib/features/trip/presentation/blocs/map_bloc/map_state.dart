part of 'map_bloc.dart';

class MapState extends Equatable {
  final Position? position;
  final RequestState currentLocationState;
  final List<Placemark>? placeMarks;
  final List<PlacePredictionEntity>? placeSuggestions;
  final RequestState placeSuggestionsState;
  final String? error;
  const MapState(
      {this.position,
      this.currentLocationState = RequestState.loading,
      this.placeMarks,
      this.placeSuggestions,
      this.placeSuggestionsState = RequestState.initial,
      this.error});
  MapState copyWith(
      {Position? position,
      RequestState? currentLocationState,
      List<Placemark>? placeMarks,
      List<PlacePredictionEntity>? placeSuggestions,
      RequestState? placeSuggestionsState,
      String? error}) {
    return MapState(
      position: position ?? this.position,
      currentLocationState: currentLocationState ?? this.currentLocationState,
      placeMarks: placeMarks ?? this.placeMarks,
      placeSuggestions: placeSuggestions ?? this.placeSuggestions,
      placeSuggestionsState: placeSuggestionsState ?? this.placeSuggestionsState,
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
        error,
      ];
}
