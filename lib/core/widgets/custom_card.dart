import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.height, this.width,this.child,this.horizontal=10});
  final double? height;
    final double? width;

  final Widget ?child;
  final double? horizontal;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding:EdgeInsets.symmetric(horizontal: horizontal??10.w),
      width: width??MediaQuery.sizeOf(context).width,
      height: height ?? 150.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow:const [
            BoxShadow(
                offset: Offset(0, 5),
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.black12)
          ]),
      child: ClipRRect(
         borderRadius: BorderRadius.circular(10.r),
        child: child),
    );
  }
}
