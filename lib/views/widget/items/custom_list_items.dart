import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/controllers/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/items_model.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToItemsDetailsScreen(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: itemsModel.id,
                    child: Image.asset(
                      'assets/images/laptop.png',
                      height: 95,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(translateDatabase(itemsModel.nameAr, itemsModel.name),
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModel.price} \$",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      GetBuilder<FavoriteControllerImp>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            
                            if (controller.isfavorite[itemsModel.id] == 1) {
                              controller.setFavorite(itemsModel.id, 0);
                              controller.removeItem(itemsModel.id);
                            } else {
                              controller.setFavorite(itemsModel.id, 1);
                              controller.addItem(itemsModel.id);
                            }
                          },
                          icon: Icon(
                            controller.isfavorite[itemsModel.id] == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ));
  }
}
