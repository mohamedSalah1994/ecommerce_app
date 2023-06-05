import 'package:ecommerce_app/controllers/auth/signup_controller.dart';
import 'package:ecommerce_app/views/widget/auth/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_login_signup_text.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_form_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAuthAppBar(
          titleText: 'Sign Up',
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
            const CustomTextTitleAuth(titleText: 'Welcome Back'),
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
              labelText: 'User Name',
              hintText: 'Enter Your User Name',
              icon: Icons.person_outlined,
              myController: controller.username,
            ),
             CustomTextFormAuth(
              labelText: 'Email',
              hintText: 'Enter Your Email',
              icon: Icons.email_outlined,
              myController: controller.email,
            ),
             CustomTextFormAuth(
              labelText: 'Phone',
              hintText: 'Enter Your Phone',
              icon: Icons.phone_android_outlined,
              myController: controller.phone,
            ),
             CustomTextFormAuth(
              labelText: 'Password',
              hintText: 'Enter Your Password',
              icon: Icons.lock_outline,
              myController: controller.password,
            ),
            Text('Forget Password',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.end),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomButtonAuth(
                text: 'Sign In',
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomLoginOrSignUpText(
                text1: " have an account ? ",
                text2: ' Login',
                onTap: () {
                  controller.goToLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}