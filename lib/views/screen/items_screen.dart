import 'package:ecommerce_app/controllers/favorite_controller.dart';
import 'package:ecommerce_app/controllers/items_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';

import 'package:ecommerce_app/views/widget/custom_app_bar.dart';
import 'package:ecommerce_app/views/widget/items/custom_list_items.dart';

import 'package:ecommerce_app/views/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/items_model.dart';
import '../widget/search/list_items_search.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp(ItemsControllerImp));
    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppbar: 'Find your Product',
              myController: controller.search,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedSearch: () {
                // controller.onSearchItems();
              },
            ),
            const SizedBox(height: 20),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch ?
                 GridView.builder(
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
                    return CustomListItems(
                      itemsModel: ItemsModel.fromJson(controller.items[index]),
                    );
                  },
                ) : ListItemsSearch(listDataModel: controller.listData) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
