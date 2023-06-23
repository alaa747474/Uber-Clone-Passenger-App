import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 15.w),
      child: FloatingActionButton.small(
          onPressed: () => Navigator.pop(context),
          elevation: 10,
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).cardColor,
          child: const Center(child: Icon(Icons.arrow_back))),
    );
  }
}
