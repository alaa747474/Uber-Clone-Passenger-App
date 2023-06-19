import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/constants/app_routes_name.dart';
import 'package:uber_clone/core/widgets/custom_app_bar.dart';
import 'package:uber_clone/core/widgets/custom_button.dart';
import 'package:uber_clone/core/widgets/custom_card.dart';
import 'package:uber_clone/features/home/presentation/widgets/intro_card.dart';
import 'package:uber_clone/features/home/presentation/widgets/saved_place_button.dart';
import 'package:uber_clone/features/trip/presentation/widgets/map_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Stack(
          clipBehavior: Clip.none,
          children: [CustomAppBar(), IntroCard()],
        ),
        SizedBox(
          height: 80.h,
        ),
        const SavedPlaceButton(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: const Text('Around you'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: const CustomCard(
            horizontal: 0,
            child: MapView(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
          child: CustomButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.tripScreen),
              text: 'Book a ride now !'),
        ),
      ],
    ));
  }
}
