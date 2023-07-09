import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetPassword/verify_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class VerifyCodeController extends GetxController {
  checkVerifyCode(String verfiyCodeSignUp);
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  String? email;
  StatusRequest? statusRequest;
  @override
  checkVerifyCode(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postdata(email!, verfiyCodeSignUp);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(
          AppRoutes.resetPassword,
          arguments: {"email": email},
        );
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
