import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassScreen();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  goToForgetPassScreen() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  login() {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      print('valid') ;
    } else {
      print('not valid') ;
    }
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
