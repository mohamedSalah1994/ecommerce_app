import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';

import 'package:ecommerce_app/views/widget/home/custom_app_bar.dart';
import 'package:ecommerce_app/views/widget/home/custom_card_home.dart';
import 'package:ecommerce_app/views/widget/home/custom_title_home.dart';
import 'package:ecommerce_app/views/widget/home/list_categories_home.dart';
import 'package:ecommerce_app/views/widget/home/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return 
       GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: const [
                CustomAppBar(titleAppbar: 'Find your Product'),
                CustomCardHome(
                    title: 'A summer surprise', body: 'Cash back 20%'),
                CustomTitleHome(title: 'Categories'),
                ListCategoriesHome(),
                CustomTitleHome(title: 'Product for you'),
                ListItemsHome(),
                CustomTitleHome(title: 'Offer'),
                ListItemsHome(),
              ],
            ),
          ),
        ),
      );
    
  }
}
