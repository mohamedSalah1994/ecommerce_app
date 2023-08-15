import 'package:ecommerce_app/controllers/items_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class TopItemsDetailsPage extends GetView<ItemsDetailsControllerImp> {
  const TopItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.secondColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: controller.itemsModel.id,
            child: Image.asset(
              'assets/images/laptop1.png',
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
