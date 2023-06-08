import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkVerfyCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
   late TextEditingController code;
  @override
  checkVerfyCode() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }

    @override
  void onInit() {
    code = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }
}
