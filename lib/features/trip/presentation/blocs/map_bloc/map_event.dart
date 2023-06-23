part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}
class GetCurrentPosition extends MapEvent {
    @override
  List<Object> get props => [];
}

class GetPlaceMarks extends MapEvent {


  const GetPlaceMarks();
  @override
  List<Object> get props => [];
}

class GetPlaceSuggestions extends MapEvent{
  final String placeName;

  const GetPlaceSuggestions(this.placeName);
    @override
  List<Object> get props => [placeName];
}
