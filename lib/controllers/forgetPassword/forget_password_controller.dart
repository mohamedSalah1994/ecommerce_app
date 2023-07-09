
import 'package:ecommerce_app/data/datasource/remote/forgetPassword/check_email.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data.dart';


abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
   late TextEditingController email;
     GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  checkEmail() async{
        if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(
        email.text,
       
        
      );
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.toNamed(AppRoutes.verifyCode , arguments: {"email": email.text});
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
    
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    
    super.dispose();
  }
}
