import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor, // Text color
          padding: const EdgeInsets.all(15), // Button padding
          textStyle: const TextStyle(fontSize: 18), // Text style
        ),
        child:  Text(title),
      ),
    );
  }
}
