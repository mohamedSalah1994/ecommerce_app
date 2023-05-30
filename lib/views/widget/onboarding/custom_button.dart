import 'package:flutter/material.dart';


import '../../../core/constant/color.dart';

class CustomButtonOnboarding extends StatelessWidget {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Continue',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
