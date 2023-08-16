import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/item_data.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, int catVal);
  getData(int categoryId);
  goToItemsDetailsScreen(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  int? selectedCat;

  int? catId;
  ItemData itemData = ItemData(Get.find());
  MyServices myServices = Get.find();
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
      int? userId = myServices.sharedPreferences.getInt('id');
    
    statusRequest = StatusRequest.loading;
    var response = await itemData.getData( userId! , categoryId);
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

  @override
  goToItemsDetailsScreen(itemsModel) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {'itemsModel': itemsModel});
  }
}
