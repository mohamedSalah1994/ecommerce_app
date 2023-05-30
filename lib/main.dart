import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/views/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'PlayfairDisplay',
        textTheme:  TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 , color: AppColor.black),
          bodyLarge: TextStyle(height: 2, color: AppColor.grey),     
        ),
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingScreen(),
      routes: routes,
    );
  }
}




  

