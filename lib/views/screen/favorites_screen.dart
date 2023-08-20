import 'package:ecommerce_app/controllers/my_favorites_controller.dart';
import 'package:ecommerce_app/data/model/favorite_item_model.dart';
import 'package:ecommerce_app/views/widget/custom_app_bar.dart';
import 'package:ecommerce_app/views/widget/favorites/custom_favorites_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/favorite_controller.dart';
import '../../core/class/handling_data_view.dart';


class FavoritesScreen extends StatelessWidget {
 
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(MyFavoritesControllerImp());
     FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
              children: [
          const CustomAppBar(titleAppbar: 'Find your product'),
          const SizedBox(height: 20),
            GetBuilder<MyFavoritesControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  itemCount: controller.items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
           favController.isfavorite[controller.items[index]['id']] =
                        controller.items[index]['favorite'];
                    return CustomFavoritesItems(
                     favoriteItem : FavoriteItem.fromJson(controller.items[index]),
                    );
                  },
                ),
              ),
            ),
              ],
            ),
        ));
  }
}
