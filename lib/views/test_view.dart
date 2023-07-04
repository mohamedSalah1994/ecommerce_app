import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/test_controller.dart';
import '../core/class/handling_data_view.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return Text(controller.data.toString());
      }),
    );
  }
}
