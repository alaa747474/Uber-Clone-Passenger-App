import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/features/trip/presentation/widgets/disabled_search_container.dart';

import '../blocs/map_bloc/map_bloc.dart';

class DetailsBottomSheet extends StatelessWidget {
  const DetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        maxChildSize: 0.9,
        minChildSize: 0.2,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black12,
                        blurRadius: 25,
                        spreadRadius: 5)
                  ],
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r))),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: BlocBuilder<MapBloc, MapState>(
                        builder: (context, state) {
                          return Text(
                            '${state.placeMarks!.first.country}, ${state.placeMarks!.first.administrativeArea}, ${state.placeMarks!.first.locality}.',
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Text(
                        'Where do you want to go?',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const DisabledSearchContainer()
                  ],
                ),
              ));
        },
      ),
    );
  }
}
