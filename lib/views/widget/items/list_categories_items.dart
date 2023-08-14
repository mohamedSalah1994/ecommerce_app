import 'package:ecommerce_app/controllers/items_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeCat(i! , categoriesModel.id);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
            padding: const EdgeInsets.only(right: 10 , left: 10 , bottom: 5),
            decoration: controller.selectedCat == i
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                : null,
            child: Text(
              translateDatabase(categoriesModel.nameAr, categoriesModel.name),
            ),
          ),)
        ],
      ),
    );
  }
}
