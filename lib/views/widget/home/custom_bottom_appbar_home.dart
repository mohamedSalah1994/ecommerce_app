import 'package:ecommerce_app/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button_appbar.dart';

class CustomBottomAppbarHome extends StatelessWidget {
  const CustomBottomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          children: [
            ...List.generate(
              controller.pagesList.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        iconData: controller.bottomAppbarIconsList[i],
                        textButton: controller.titleBottomAppbarList[i],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentPage == i ? true : false,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
