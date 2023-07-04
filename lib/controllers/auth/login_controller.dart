import 'package:ecommerce_app/core/constant/routes.dart';
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
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());
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
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.home);
        } else if (response['status'] == "failure") {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Wrong email or password");
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
