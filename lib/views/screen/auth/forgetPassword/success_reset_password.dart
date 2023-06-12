import 'package:ecommerce_app/controllers/auth/success_reset_password_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/auth/custom_auth_appbar.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAuthAppBar(
          titleText: 'Success',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColors.primaryColor,
              ),
              const CustomTextTitleAuth(titleText: 'Success Reset Password'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: 'Go To Login',
                  onPressed: () {
                    controller.goToLoginPage();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
