import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPAsswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPAsswordControllerImp extends ResetPAsswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoutes.successResetPassword);
  }


  @override
  resetPassword() {
    
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
