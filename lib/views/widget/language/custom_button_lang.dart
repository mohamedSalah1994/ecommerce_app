import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomButtonLang extends StatelessWidget {
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: onPressed,
            color: AppColors.primaryColor,
            textColor: Colors.white,
            child: Text(
              textButton,
            ),
          ),
        ),
      ),
    );
  }
}
