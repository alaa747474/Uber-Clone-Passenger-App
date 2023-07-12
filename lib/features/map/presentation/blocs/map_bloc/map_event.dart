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
class GetPlaceDetails extends MapEvent{
  final String placeId;

  const GetPlaceDetails(this.placeId);
    @override
  List<Object> get props => [placeId];
}
class GetPlaceDirections extends MapEvent{
  final LatLng destination;

  const GetPlaceDirections(this.destination);
    @override
  List<Object> get props => [destination];
}
class DrawPolyline extends MapEvent{

  const DrawPolyline();
    @override
  List<Object> get props => [];
}

class RemovePolyline extends MapEvent{

  const RemovePolyline();
    @override
  List<Object> get props => [];
}
