import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: AppColors.grey),
      backgroundColor: AppColors.backgroundcolor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: AppColors.grey),
      ),
    );
  }
}
