import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
