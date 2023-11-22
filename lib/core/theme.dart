import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

 ThemeData appTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme:  TextTheme(
          headlineLarge:
              TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold,fontSize: 19.sp,),
          bodyMedium: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      );