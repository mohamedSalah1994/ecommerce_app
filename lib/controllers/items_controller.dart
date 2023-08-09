import 'package:ecommerce_app/data/datasource/remote/item_data.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val);
  getData();
}

class ItemsControllerImp extends ItemsController {
  int? selectedCat;

  MyServices myServices = Get.find();
  String? name;
  int? id;
  ItemData homeData = ItemData(Get.find());

  List items = [];
  List categories = [];

  late StatusRequest statusRequest;
  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
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
  }

  @override
  changeCat(int val) {
    selectedCat = val;
    update();
  }
}
