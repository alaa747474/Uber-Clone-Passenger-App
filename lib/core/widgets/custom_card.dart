import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.height, this.child,this.horizontal=10});
  final double? height;
  final Widget ?child;
  final double? horizontal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: horizontal??10.w),
      width: double.maxFinite,
      height: height ?? 150.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow:const [
            BoxShadow(
                offset: Offset(0, 7),
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.black12)
          ]),
      child: child,
    );
  }
}
