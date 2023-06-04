import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/views/widget/auth/custom_button_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_form_auth.dart';
import 'package:ecommerce_app/views/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce_app/views/widget/auth/logo_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColor.grey),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColor.grey),
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
            const SizedBox(
              height: 170,
              child: LogoAuth(),
              ),
            const CustomTextTitleAuth(titleText: 'Welcome Back'),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const CustomTextBodyAuth(bodyText: 'Sign In with your email and password or continue with social media',)
            ),
            const SizedBox(
              height: 65,
            ),
            const CustomTextFormAuth(
              labelText: 'Email',
              hintText: 'Enter Your Email',
              icon: Icons.email_outlined,
            ),
            const CustomTextFormAuth(
              labelText: 'Password',
              hintText: 'Enter Your Password',
              icon: Icons.lock_outline,
            ),

             CustomButtonAuth(text: 'Sign In' ,onPressed: (){},)
          ],
        ),
      ),
    );
  }
}
