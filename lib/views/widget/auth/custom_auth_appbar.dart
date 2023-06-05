import 'package:flutter/material.dart';


import '../../../core/constant/color.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: AppColor.grey),
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: AppColor.grey),
      ),
    );
  }
}
