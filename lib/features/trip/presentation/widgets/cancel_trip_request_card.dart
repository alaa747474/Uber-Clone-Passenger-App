import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:uber_clone/core/constants/app_assets.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';
import 'package:uber_clone/features/trip/presentation/widgets/cancel_trip_button.dart';

class CanelTripRequestCard extends StatelessWidget {
  const CanelTripRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: LottieBuilder.asset(AppAssets.animatedSearch),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: CustomCard(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CancelTripButton(),
                 Text(
                  'Cancel Request !!!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
