import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masjidi/shared/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Cairo',
      primaryColor: Color(0xFF337AB7),
      textTheme: TextTheme(

        labelLarge: TextStyle(fontSize: 16.sp,color: Colors.black), // Adjust the font size here
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorConstants.primaryColor, brightness: Brightness.light,
        secondary: ColorConstants.secondaryColor,
        // Other theme properties...
      ));

  static final darkTheme = ThemeData(
      fontFamily: 'Cairo',

      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)

      ),
      primaryColor: ColorConstants.primaryColor,
      textTheme: TextTheme(
        labelLarge: TextStyle(fontSize: 16.sp,color: Colors.white), // Adjust the font size here
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorConstants.primaryColor,
        brightness: Brightness.dark,
        secondary: ColorConstants.secondaryColor,
      )
      // Other theme properties...
  );
}