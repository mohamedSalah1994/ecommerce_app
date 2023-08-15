import 'package:ecommerce_app/controllers/items_details_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/views/widget/items_details/price_and_count.dart';
import 'package:ecommerce_app/views/widget/items_details/subitems_colors_list.dart';
import 'package:ecommerce_app/views/widget/items_details/top_items_details_page.dart';
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
        const TopItemsDetailsPage(),
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
              const SizedBox(height: 10),
               PriceAndCount(count: '2', price: 200.0 , onAdd: (){}, onRemove: () {}),
              const SizedBox(height: 10),
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
              const SubItemsColors(),
            ],
          ),
        )
      ]),
    );
  }
}
