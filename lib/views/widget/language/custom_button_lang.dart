import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 15),
            onPressed: onPressed,
            color: AppColor.primaryColor,
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
