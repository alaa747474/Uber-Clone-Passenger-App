import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/constants/app_routes_name.dart';
import 'package:uber_clone/core/utils/enums.dart';
import 'package:uber_clone/core/widgets/custom_back_button.dart';
import 'package:uber_clone/features/map/presentation/blocs/map_bloc/map_bloc.dart';
import 'package:uber_clone/features/map/presentation/widgets/current_location_card.dart';
import 'package:uber_clone/features/map/presentation/widgets/details_bottom_sheet.dart';
import 'package:uber_clone/features/trip/presentation/bloc/trip_bloc.dart';

import '../widgets/map_view.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const MapView(),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBackButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.homeScreen);
                      },
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const CurrentLocationCard(),
                    SizedBox(
                      width: 15.w,
                    ),
                  ],
                )),
          ),
          BlocConsumer<MapBloc, MapState>(
            listener: (context, state) {
              if (state.polylineState == RequestState.loaded) {
                context.read<TripBloc>().add(CalculateFare());
              }
            },
            builder: (context, state) {
              return const DetailsBottomSheet();
            },
          )
        ],
      ),
    );
  }
}
