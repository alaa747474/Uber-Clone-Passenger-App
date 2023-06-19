import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/constants/app_assets.dart';
import 'package:uber_clone/core/constants/app_routes_name.dart';
import 'package:uber_clone/core/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, nice to meet you !',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Get a new experience',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 30.h),
            Image.asset(
              AppAssets.carDriver,
              width: double.maxFinite,
              height: 200.h,
            ),
            SizedBox(
              height: 100.h,
            ),
            CustomButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.homeScreen),
                text: 'Start Now !')
          ],
        ),
      ),
    );
  }
}
