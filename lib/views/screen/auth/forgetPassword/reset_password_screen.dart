import 'package:ecommerce_app/controllers/auth/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/auth/custom_auth_appbar.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_form_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPAsswordControllerImp controller =
        Get.put(ResetPAsswordControllerImp());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAuthAppBar(
          titleText: 'Reset Password',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        alignment: Alignment.center,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomTextTitleAuth(titleText: 'Reset Password'),
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: const CustomTextBodyAuth(
                  bodyText:
                      'Sign In with your email and password or continue with social media',
                )),
            const SizedBox(
              height: 65,
            ),
             CustomTextFormAuth(
              valid: (val){},
              labelText: 'New Password',
              hintText: 'Enter Your New Password',
              icon: Icons.lock_outline,
              myController: controller.password,
            ),
             CustomTextFormAuth(
              valid: (val){},
              labelText: 'Confirm Password',
              hintText: 'Confirm Password',
              icon: Icons.lock_outline,
              myController: controller.repassword,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomButtonAuth(
                text: 'Save',
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
