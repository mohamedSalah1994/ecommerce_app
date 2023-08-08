
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  const CustomButtonAppBar({
    super.key,
    this.onPressed,
    required this.iconData,
    required this.textButton, required this.active,
  });
  final void Function()? onPressed;
  final IconData iconData;
  final String textButton;
  final bool active ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData , color: active == true ? AppColors.primaryColor : Colors.black,),
          Text(
            textButton,
            style: TextStyle(color: active == true ? AppColors.primaryColor : Colors.black,),
          ),
        ],
      ),
    );
  }
}
