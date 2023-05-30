import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/views/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {

  AppRoutes.login :(context) => const LoginScreen() 
};
