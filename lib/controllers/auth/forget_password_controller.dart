import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
   late TextEditingController email;
  @override
  checkEmail() {}

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoutes.verifyCode);
  }

    @override
  void onInit() {
    email = TextEditingController();
    
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    
    super.dispose();
  }
}
