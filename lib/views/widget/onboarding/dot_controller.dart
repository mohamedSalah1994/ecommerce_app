import 'package:flutter/material.dart';


import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class DotControllerOnboarding extends StatelessWidget {
  const DotControllerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBoardingList.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            margin: const EdgeInsets.only(right: 5),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
