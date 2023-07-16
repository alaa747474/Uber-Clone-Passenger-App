import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/constants/app_routes_name.dart';
import 'package:uber_clone/core/widgets/custom_back_button.dart';
import 'package:uber_clone/features/map/presentation/blocs/map_bloc/map_bloc.dart';
import 'package:uber_clone/features/map/presentation/widgets/map_view.dart';
import 'package:uber_clone/features/trip/presentation/widgets/choose_trip_bottom_sheet.dart';

import '../../../map/presentation/widgets/disabled_search_container.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

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
                      context.read<MapBloc>().add(const RemovePolyline());
                      Navigator.pushNamed(context, AppRoutes.mapScreen);
                    },
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  DisabledSearchContainer(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              )),
        ),
        const ChooseTrioBottomSheet(),
      ],
    ));
  }
}
