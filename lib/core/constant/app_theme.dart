import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'PlayfairDisplay',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      height: 1.7,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.black,
    ),
  ),
  primarySwatch: Colors.blue,
);


ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppColors.grey,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      height: 1.7,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.black,
    ),
  ),
  primarySwatch: Colors.blue,
);
