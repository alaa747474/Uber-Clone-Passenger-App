import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme() => ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: textTheme(),
        useMaterial3: true,
        primaryColor: const Color(0xff58BE3F),
        highlightColor: const Color.fromARGB(255, 43, 50, 119),
        cardColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF2F2F2),
      );
  static TextTheme textTheme() {
    return TextTheme(
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
      bodyLarge:  TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
      bodyMedium:  TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
      ),
      bodySmall:  TextStyle(
        color: Colors.grey,
        fontSize: 12.sp,
      ),
    );
  }
}
