import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/widgets/custom_back_button.dart';

import 'package:uber_clone/features/trip/presentation/widgets/current_location_card.dart';
import 'package:uber_clone/features/trip/presentation/widgets/map_view.dart';
import 'package:uber_clone/features/trip/presentation/widgets/trip_details_bottom_sheet.dart';

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
                    const CustomBackButton(),
                    SizedBox(
                      width: 15.w,
                    ),
                    const CurrentLocationCard()
                  ],
                )),
          ),
          const TripDetailsBottomSheet()
        ],
      ),
    );
  }
}
