import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomLoginOrSignUpText extends StatelessWidget {
  const CustomLoginOrSignUpText(
      {super.key, required this.text1, required this.text2, this.onTap});
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
