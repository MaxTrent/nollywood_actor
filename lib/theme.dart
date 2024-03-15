import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme {
  ThemeData get light => ThemeData(
    splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Satoshi',
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Satoshi',
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Satoshi',
          color: Colors.black,
          fontSize: 14.sp,
        ),
      ));
}