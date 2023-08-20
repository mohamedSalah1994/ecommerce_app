import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(int id, int val);
  addItem(int itemId);
  removeItem(int itemId);
}

class FavoriteControllerImp extends FavoriteController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  Map isfavorite = {};

  @override
  setFavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  @override
  addItem(itemId) async {
    statusRequest = StatusRequest.loading;
    int? userId = myServices.sharedPreferences.getInt('id');
    var response = await favoriteData.addItem(userId!, itemId);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج من المفضلة "),
        );
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeItem(itemId) async {
    statusRequest = StatusRequest.loading;
    int? userId = myServices.sharedPreferences.getInt('id');
    var response = await favoriteData.removeItem(userId!, itemId);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة "));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
