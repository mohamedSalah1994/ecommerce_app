import 'package:ecommerce_app/controllers/auth/check_email_controller.dart';

import 'package:ecommerce_app/views/widget/auth/custom_auth_appbar.dart';
import 'package:ecommerce_app/views/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_title_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller =
        Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAuthAppBar(
          titleText: 'Check Email',
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
            const CustomTextTitleAuth(titleText: 'Success Sign Up'),
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
              labelText: 'Email',
              hintText: 'Enter Your Email',
              icon: Icons.email_outlined,
              myController: controller.email,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomButtonAuth(
                text: 'Check',
                onPressed: () {
                  controller.goToVerifyCode();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
