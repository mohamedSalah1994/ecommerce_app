import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/views/screen/auth/check_email_screen.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/forget_password_screen.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/reset_password_screen.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/success_reset_password.dart';
import 'package:ecommerce_app/views/screen/auth/forgetPassword/verify_code_screen.dart';

import 'package:ecommerce_app/views/screen/auth/login_screen.dart';

import 'package:ecommerce_app/views/screen/auth/signup_screen.dart';

import 'package:ecommerce_app/views/screen/auth/success_sign_up.dart';
import 'package:ecommerce_app/views/screen/auth/verifycode_signup_screen.dart';

import 'package:ecommerce_app/views/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // auth routes
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.signup: (context) => const SignUpScreen(),
  AppRoutes.forgetPassword: (context) => const ForgetPasswordScreen(),
  AppRoutes.verifyCode: (context) => const VerifyCodeScreen(),
  AppRoutes.verifyCodeSignUp: (context) => const VerifyCodeSignUpScreen(),
  AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),
  AppRoutes.successResetPassword: (context) => const SuccessResetPassword(),
  AppRoutes.successSignUp: (context) => const SuccessSignUp(),
  AppRoutes.checkEmail: (context) => const CheckEmailScreen(),

//onBoarding route
  AppRoutes.onboarding: (context) => const OnBoardingScreen(),
};
