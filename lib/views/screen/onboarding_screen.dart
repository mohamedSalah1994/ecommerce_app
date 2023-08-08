import 'package:ecommerce_app/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/views/widget/onboarding/custom_button.dart';
import 'package:ecommerce_app/views/widget/onboarding/custom_slider.dart';
import 'package:ecommerce_app/views/widget/onboarding/dot_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnboarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotControllerOnboarding(),
                  Spacer(flex: 3),
                  CustomButtonOnboarding(),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
