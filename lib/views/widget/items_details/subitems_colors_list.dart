import 'package:ecommerce_app/controllers/items_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class SubItemsColors extends GetView<ItemsDetailsControllerImp> {
  const SubItemsColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subItems[index]['active'] == '1'
                    ? AppColors.fourthColor
                    : Colors.white,
                border: Border.all(color: AppColors.fourthColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              controller.subItems[index]['name'],
              style: TextStyle(
                  color: controller.subItems[index]['active'] == '1'
                      ? Colors.white
                      : AppColors.fourthColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
