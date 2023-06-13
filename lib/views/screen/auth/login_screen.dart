import 'package:ecommerce_app/controllers/auth/login_controller.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/views/widget/auth/custom_auth_appbar.dart';
import 'package:ecommerce_app/views/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_login_signup_text.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce_app/views/widget/auth/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: CustomAuthAppBar(
            titleText: '9'.tr,
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            alignment: Alignment.center,
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 170,
                    child: LogoAuth(),
                  ),
                  CustomTextTitleAuth(titleText: '10'.tr),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomTextBodyAuth(
                        bodyText: '11'.tr,
                      )),
                  const SizedBox(
                    height: 65,
                  ),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 100, 'email');
                    },
                    labelText: '18'.tr,
                    hintText: '12'.tr,
                    icon: Icons.email_outlined,
                    myController: controller.email,
                  ),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 30, 'password');
                    },
                    labelText: '19'.tr,
                    hintText: '13'.tr,
                    icon: Icons.lock_outline,
                    myController: controller.password,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.goToForgetPassScreen();
                    },
                    child: Text('14'.tr,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomButtonAuth(
                      text: '15'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLoginOrSignUpText(
                      text1: "16".tr,
                      text2: '17'.tr,
                      onTap: () {
                        controller.goToSignUp();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
