import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/views/screen/auth/forget_password_screen.dart';
import 'package:ecommerce_app/views/screen/auth/login_screen.dart';
import 'package:ecommerce_app/views/screen/auth/reset_password_screen.dart';
import 'package:ecommerce_app/views/screen/auth/signup_screen.dart';
import 'package:ecommerce_app/views/screen/auth/verify_code_screen.dart';
import 'package:ecommerce_app/views/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // auth routes
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.signup: (context) => const SignUpScreen(),
  AppRoutes.forgetPassword: (context) => const ForgetPasswordScreen(),
  AppRoutes.verifyCode: (context) => const VerifyCodeScreen(),
  AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),

//onBoarding route
  AppRoutes.onboarding: (context) => const OnBoardingScreen(),
};
