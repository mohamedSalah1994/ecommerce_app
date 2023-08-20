import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce_app/data/datasource/remote/my_favorite_data.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';

abstract class MyFavoritesController extends GetxController {
  getMyFavorites();
  removeItem(int itemId);
}

class MyFavoritesControllerImp extends MyFavoritesController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  

  MyServices myServices = Get.find();
  List items = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    getMyFavorites();
    super.onInit();
  }

  @override
  getMyFavorites() async {
    // items.clear();
    int? userId = myServices.sharedPreferences.getInt('id');

    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getMyFavorites(userId!);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeItem(itemId) {
    int? userId = myServices.sharedPreferences.getInt('id');
    myFavoriteData.removeItem(userId!, itemId);
    items.removeWhere((element) => element['id'] == itemId);
    update();
  }
}
