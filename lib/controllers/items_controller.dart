import 'package:ecommerce_app/data/datasource/remote/item_data.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, int catVal);
  getData(int categoryId);
}

class ItemsControllerImp extends ItemsController {
  int? selectedCat;

  int? catId;
  ItemData itemData = ItemData(Get.find());

  List items = [];
  List categories = [];

  late StatusRequest statusRequest;
  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  getData(categoryId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemData.getData(categoryId);
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
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    getData(catId!);
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
     getData(catId!);
    update();
  }
}
