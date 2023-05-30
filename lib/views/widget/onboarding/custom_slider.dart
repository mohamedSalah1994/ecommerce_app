import 'package:ecommerce_app/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnboarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
       controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
        
      },
     
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text(
              onBoardingList[index].title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              onBoardingList[index].image!,
              width: 200,
              height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(height: 2, color: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}
