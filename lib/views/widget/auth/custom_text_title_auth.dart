import 'package:flutter/material.dart';


class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        titleText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
