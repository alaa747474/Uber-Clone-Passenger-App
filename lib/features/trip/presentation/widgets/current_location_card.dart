import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/features/trip/presentation/blocs/map_bloc/map_bloc.dart';

import '../../../../core/widgets/custom_card.dart';

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomCard(
        height: 40.h,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Center(
                child: Text(
              '${state.placeMarks!.first.country}, ${state.placeMarks!.first.administrativeArea}, ${state.placeMarks!.first.locality}.',
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: Theme.of(context).textTheme.bodySmall,
            ));
          },
        ),
      ),
    );
  }
}
