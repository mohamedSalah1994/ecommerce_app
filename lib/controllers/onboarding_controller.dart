import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  nextPage();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;
  @override
  nextPage() {
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
   
    super.onInit();
    pageController = PageController();
  }
}
