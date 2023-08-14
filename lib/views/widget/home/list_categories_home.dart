import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
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

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToItems(controller.categories, i! , categoriesModel.id);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12)),
            child: Icon(
              Icons.abc,
              color: AppColors.primaryColor,
            ),
          ),
          Text(translateDatabase(categoriesModel.nameAr, categoriesModel.name))
        ],
      ),
    );
  }
}
