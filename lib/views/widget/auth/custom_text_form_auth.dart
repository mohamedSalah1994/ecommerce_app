import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.icon,
      this.myController});
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController? myController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        decoration: InputDecoration(
          
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(labelText , style: TextStyle(color: AppColor.grey),),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            suffixIcon: Icon(icon , color: AppColor.primaryColor,),
                            focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide:  BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
            enabledBorder: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(32),
            )),
      ),
    );
  }
}
