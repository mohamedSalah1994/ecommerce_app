
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/items_model.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
  getCountItems(int itemId);
    addToCart(int itemId);
  removeFromCart(int itemId);
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
 
  MyServices myServices = Get.find();
  int countitems = 0;
  late StatusRequest statusRequest;
  List subItems = [
    {'id': 1, 'name': 'Red', 'active': '0'},
    {'id': 2, 'name': 'Blue', 'active': '0'},
    {'id': 3, 'name': 'Black', 'active': '1'},
  ];
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countitems = await getCountItems(itemsModel.id);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  getCountItems(itemId) async {
    statusRequest = StatusRequest.loading;
    int? userId = myServices.sharedPreferences.getInt('id');
    var response = await cartData.countItems(userId!, itemId);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response['data'];
        if (kDebugMode) {
          print("==================================");
        }
        if (kDebugMode) {
          print("$countitems");
        }
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    return 0;
  }

  add() {
    addToCart(itemsModel.id);
    countitems++;
    update();
  }

    @override
  addToCart(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    int? userId = myServices.sharedPreferences.getInt('id');
    var response = await cartData.addItem(userId!, itemId);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الى السله "),
        );
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFromCart(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    int? userId = myServices.sharedPreferences.getInt('id');
    var response = await cartData.removeItem(userId!, itemId);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف المنتج من السله "));
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  remove() {
    if (countitems > 0) {
       removeFromCart(itemsModel.id);
      countitems--;
      update();
    }
  }
}
