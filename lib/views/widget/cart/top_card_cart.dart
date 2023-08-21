import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class TopCardCart extends StatelessWidget {
  const TopCardCart({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.thirdColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
