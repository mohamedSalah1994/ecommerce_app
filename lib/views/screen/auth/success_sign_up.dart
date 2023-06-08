import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../widget/auth/custom_auth_appbar.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAuthAppBar(
          titleText: 'Success Sign up',
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
              const CustomTextTitleAuth(titleText: 'Success Sign up'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: 'Go To Login',
                  onPressed: () {},
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
