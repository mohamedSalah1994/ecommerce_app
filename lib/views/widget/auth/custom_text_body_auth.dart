import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({super.key, required this.bodyText});
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.grey),
      textAlign: TextAlign.center,
    );
  }
}
