import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/localization/change_locale.dart';
import 'package:ecommerce_app/views/widget/language/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1'.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonLang(
                textButton: 'AR',
                onPressed: () {
                  controller.changeLang('ar');
                  Get.toNamed(AppRoutes.onboarding);
                },
              ),
              CustomButtonLang(
                textButton: 'EN',
                onPressed: () {
                  controller.changeLang('en');
                  Get.toNamed(AppRoutes.onboarding);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
