

import 'package:ecommerce_app/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button_appbar.dart';

class CustomBottomAppbarHome extends StatefulWidget {
  const CustomBottomAppbarHome({super.key});

  @override
  State<CustomBottomAppbarHome> createState() => _CustomBottomAppbarHomeState();
}

class _CustomBottomAppbarHomeState extends State<CustomBottomAppbarHome> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the height of the bottom navigation bar.
  }

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
              ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        iconData: controller.bottomappbar[i]['icon'],
                        textButton: controller.bottomappbar[i]['title'],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentPage == i ? true : false,
                      );
              } ))
          ],
        ),
      ),
    );
  }
}
