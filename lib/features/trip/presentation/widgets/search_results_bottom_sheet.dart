import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/core/widgets/loading_indicator.dart';
import 'package:uber_clone/features/trip/presentation/widgets/current_location_card.dart';
import 'package:uber_clone/features/trip/presentation/widgets/search_text_field.dart';

import '../../../../core/widgets/custom_card.dart';
import '../blocs/map_bloc/map_bloc.dart';

class SearchResultsBottomSheet extends StatelessWidget {
  const SearchResultsBottomSheet({super.key});
  Widget _customRow(BuildContext context, Widget child) {
    return Row(
      children: [
        CustomCard(
          height: 40.r,
          width: 40.r,
          child: Icon(
            Icons.location_pin,
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

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          _customRow(context, const CurrentLocationCard()),
          SizedBox(
            height: 20.h,
          ),
          _customRow(
            context,
            const Flexible(child: SearchTextField()),
          ),
          const SizedBox(height: 50,),
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              if (state.placeSuggestionsState ==RequestState.loaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.placeSuggestions!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(state.placeSuggestions![index].secondaryText);
                    },
                  ),
                );
              }
              if (state.placeSuggestionsState==RequestState.failed) {
                return Text(state.error!);
              }
              if (state.placeSuggestionsState==RequestState.loading) {
                return const LoadingIndicator();
              }
              if (state.placeSuggestionsState==RequestState.initial ) {
                return const Text('Start Search Now !');
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}