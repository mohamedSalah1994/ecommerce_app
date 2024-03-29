import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/views/widget/auth/custom_auth_appbar.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/verify_code_signup_controller.dart';

class VerifyCodeSignUpScreen extends StatelessWidget {
  const VerifyCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAuthAppBar(
            titleText: 'Verification Code',
          ),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              alignment: Alignment.center,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextTitleAuth(titleText: 'Check code'),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomTextBodyAuth(
                        bodyText:
                            'Please Enter The Digit Code Sent To ${controller.email}',
                      )),
                  const SizedBox(height: 65),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(16),
                    numberOfFields: 5,
                    focusedBorderColor: AppColors.primaryColor,
                    cursorColor: AppColors.black,

                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    // onCodeChanged: (String code) {
                    //   //handle validation or checks here
                    // },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      controller.resendVerifyCode();
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(
                          fontSize: 24, color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
