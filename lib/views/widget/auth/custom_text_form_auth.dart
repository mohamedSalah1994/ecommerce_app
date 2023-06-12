import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.myController,
    required this.valid, this.isNumber ,
  });
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool? isNumber ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
                keyboardType: isNumber == true
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              labelText,
              style: TextStyle(color: AppColors.grey),
            ),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          suffixIcon: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: AppColors.errColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: AppColors.errColor,
            ),
          ),
        ),
      ),
    );
  }
}
