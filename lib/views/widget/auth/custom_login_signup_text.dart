import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomLoginOrSignUpText extends StatelessWidget {
  const CustomLoginOrSignUpText({super.key, required this.text1, required this.text2, this.onTap});
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
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
