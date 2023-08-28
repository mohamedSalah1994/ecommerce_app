import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';


import 'package:ecommerce_app/views/widget/custom_app_bar.dart';
import 'package:ecommerce_app/views/widget/home/custom_card_home.dart';
import 'package:ecommerce_app/views/widget/home/custom_title_home.dart';
import 'package:ecommerce_app/views/widget/home/list_categories_home.dart';
import 'package:ecommerce_app/views/widget/home/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/search/list_items_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp(HomeControllerImp));

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCardHome(
                            title: 'A summer surprise', body: 'Cash back 20%'),
                        CustomTitleHome(title: 'Categories'),
                        ListCategoriesHome(),
                        CustomTitleHome(title: 'Product for you'),
                        ListItemsHome(),
                        CustomTitleHome(title: 'Offer'),
                        ListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(listDataModel: controller.listData),
            ),
          ],
        ),
      ),
    );
  }
}


