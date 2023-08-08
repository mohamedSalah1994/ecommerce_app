import 'package:ecommerce_app/controllers/home_screen_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/views/widget/home/custom_button_appbar.dart';
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
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              children: [
                ...List.generate(
                  controller.pagesList.length,
                  (index) => CustomButtonAppBar(
                    iconData: Icons.home,
                    textButton: 'Home',
                    onPressed: () {
                      controller.changePage(0);
                    },
                    active: controller.currentPage == 0 ? true : false,
                  ),
                ),
                // Row(
                //   children: [
                //     CustomButtonAppBar(
                //       iconData: Icons.home,
                //       textButton: 'Home',
                //       onPressed: () {
                //         controller.changePage(0);
                //       },
                //       active: controller.currentPage == 0 ? true : false,
                //     ),
                //     CustomButtonAppBar(
                //       iconData: Icons.person,
                //       textButton: 'Profile',
                //       onPressed: () {
                //         controller.changePage(1);
                //       },
                //       active: controller.currentPage == 1 ? true : false,
                //     ),
                //   ],
                // ),
                // const Spacer(),
                // Row(
                //   children: [
                //     CustomButtonAppBar(
                //       iconData: Icons.favorite,
                //       textButton: 'favorites',
                //       onPressed: () {
                //         controller.changePage(2);
                //       },
                //       active: controller.currentPage == 2 ? true : false,
                //     ),
                //     CustomButtonAppBar(
                //       iconData: Icons.settings,
                //       textButton: 'Settings',
                //       onPressed: () {
                //         controller.changePage(3);
                //       },
                //       active: controller.currentPage == 3 ? true : false,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          body: controller.pagesList.elementAt(controller.currentPage)),
    );
  }
}
