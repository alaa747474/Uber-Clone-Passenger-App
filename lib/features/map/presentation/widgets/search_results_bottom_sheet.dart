import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/core/widgets/loading_indicator.dart';
import 'package:uber_clone/features/map/presentation/widgets/current_location_card.dart';
import 'package:uber_clone/features/map/presentation/widgets/search_text_field.dart';
import 'package:uber_clone/features/map/presentation/widgets/searched_place_card.dart';
import '../../../../core/widgets/custom_card.dart';
import '../blocs/map_bloc/map_bloc.dart';

class SearchResultsBottomSheet extends StatelessWidget {
  const SearchResultsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: MediaQuery.sizeOf(context).height * 0.9,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          _customRow(context, const CurrentLocationCard(), false),
          SizedBox(
            height: 20.h,
          ),
          _customRow(context, const Flexible(child: SearchTextField()), true),
          SizedBox(
            height: 50.h,
          ),
          BlocConsumer<MapBloc, MapState>(
            listener: (context, state) {
              // if (state.placeDetailsState == RequestState.loaded) {
              //   context.read<MapBloc>().add(GetPlaceDirections(
              //       LatLng(state.placeDetails!.lat, state.placeDetails!.long)));
              // }
              // if (state.placeDirectionsState == RequestState.loaded) {
              //   context.read<MapBloc>().add(const DrawPolyline());
              // }
              
            },
            builder: (context, state) {
              if (state.placeSuggestionsState == RequestState.loaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.placeSuggestions!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchedPlaceCard(
                          placePrediction: state.placeSuggestions![index]);
                    },
                  ),
                );
              }
              if (state.placeSuggestionsState == RequestState.failed) {
                return Text(state.error!);
              }
              if (state.placeSuggestionsState == RequestState.loading || state.polylineState==RequestState.loading) {
                return const LoadingIndicator();
              }
              if (state.placeSuggestionsState == RequestState.initial) {
                return const Text('Start Search Now !');
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget _customRow(BuildContext context, Widget child, bool directions) {
    return Row(
      children: [
        CustomCard(
          height: 40.r,
          width: 40.r,
          child: Icon(
            directions ? Icons.directions : Icons.my_location,
            color: Theme.of(context).primaryColor,
            size: 25.r,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        child,
        SizedBox(
          width: 15.w,
        )
      ],
    );
  }
}
