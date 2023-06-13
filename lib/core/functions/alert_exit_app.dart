import 'dart:io';

import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "39".tr,
      titleStyle:  TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold),
      middleText: "40".tr,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: Text("41".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: Text("42".tr))
      ]);
  return Future.value(true);
}