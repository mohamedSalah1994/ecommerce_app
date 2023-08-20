import 'package:ecommerce_app/controllers/my_favorites_controller.dart';
import 'package:ecommerce_app/data/model/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/constant/app_colors.dart';
import '../../../core/functions/translate_database.dart';

class CustomFavoritesItems extends GetView<MyFavoritesControllerImp> {
  final FavoriteItem favoriteItem;
  const CustomFavoritesItems({
    super.key,
    required this.favoriteItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/laptop.png',
                    height: 95,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(favoriteItem.nameAr, favoriteItem.name),
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
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
                      Text("${favoriteItem.price} \$",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      GetBuilder<MyFavoritesControllerImp>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                              controller.removeItem(favoriteItem.id);
                          },
                          icon: Icon(
                             Icons.delete_outline,
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
