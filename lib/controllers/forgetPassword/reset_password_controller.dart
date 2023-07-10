import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetPassword/reset_password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController passwordconfirmation;
  String? email;
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
   StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData loginData = ResetPasswordData(Get.find());
  bool isShowPassword = true;
  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoutes.successResetPassword);
  }


  @override
  resetPassword() async{
        if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
        email!,
        password.text,
        passwordconfirmation.text
        
      );
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.successResetPassword);
        } else if (response['status'] == "failure") {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: response['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
     email = Get.arguments['email'];
    password = TextEditingController();
    passwordconfirmation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    passwordconfirmation.dispose();
    super.dispose();
  }
}
