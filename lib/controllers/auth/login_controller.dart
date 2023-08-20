import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassScreen();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassScreen() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
        email.text,
        password.text,
      );
      if (kDebugMode) {
        print("==============*================= Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['user_approve'] == true) {
            // data.addAll(response['data']);
            myServices.sharedPreferences
                .setInt("id", response['data']['id']);
            myServices.sharedPreferences
                .setString("name", response['data']['name']);
            myServices.sharedPreferences
                .setString("email", response['data']['email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['phone']);
            myServices.sharedPreferences.setString("step", '2');
            Get.offNamed(AppRoutes.home);
          } else {
            Get.toNamed(
              AppRoutes.verifyCodeSignUp,
              arguments: {"email": email.text},
            );
          }
          
        } else if (response['status'] == "failure") {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Wrong email or password");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
