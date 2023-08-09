import 'package:ecommerce_app/controllers/items_controller.dart';
import 'package:ecommerce_app/views/widget/custom_app_bar.dart';

import 'package:ecommerce_app/views/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ItemsControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: const [
          CustomAppBar(
            titleAppbar: 'Find your product',
          ),
          SizedBox(height: 20,),
          ListCategoriesItems(),
        ],
      ),
    ));
  }
}
