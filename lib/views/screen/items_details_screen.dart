import 'package:ecommerce_app/controllers/items_details_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetailsScreen extends StatelessWidget {
  const ItemsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 40,
        child: MaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.secondColor,
          child: const Text(
            'Add To Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(children: [
        Stack(
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
        ),
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translateDatabase(
                  controller.itemsModel.nameAr,
                  controller.itemsModel.name,
                ),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.fourthColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${controller.itemsModel.desc}'
                '${controller.itemsModel.desc}'
                '${controller.itemsModel.desc}'
                '${controller.itemsModel.desc}'
                '${controller.itemsModel.desc}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.fourthColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Color',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.fourthColor),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        color: AppColors.fourthColor,
                        border: Border.all(color: AppColors.fourthColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Red',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.fourthColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Black',
                      style: TextStyle(
                          color: AppColors.fourthColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.fourthColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Blue',
                      style: TextStyle(
                          color: AppColors.fourthColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
