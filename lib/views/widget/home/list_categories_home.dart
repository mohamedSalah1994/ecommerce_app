import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                controller.categoryIcons[index],
                color: AppColors.primaryColor,
              ),
            ),
            const Text('data')
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categoryIcons.length,
      ),
    );
  }
}
