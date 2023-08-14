import 'package:ecommerce_app/controllers/home_screen_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/views/widget/home/custom_bottom_appbar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {},
            child: const Icon(
              Icons.shopping_basket_outlined,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
           bottomNavigationBar: const CustomBottomAppbarHome(),
          body: controller.pagesList.elementAt(controller.currentPage)),
    );
  }
}
