import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/model/cart_model.dart';

abstract class CartController extends GetxController {
  addToCart(int itemId);
  removeFromCart(int itemId);
  getCart();
  getItemTotalPrice();
  getUserTotalPrice();
  refreshPage();
}

class CartControllerImp extends CartController {
  late CartModel cartModel;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List<CartItem> items = [];

  int totalItemsCount = 0;
  int totalPrice = 0;
  int shipping = 300;

  @override
  void onInit() {
    getCart();

    super.onInit();
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

  @override
  getCart() async {
    int? userId = myServices.sharedPreferences.getInt('id');

    statusRequest = StatusRequest.loading;
    update();
    items.clear();
    var response = await cartData.getCartData(userId!);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<dynamic> itemsData = response['items'];
        items.clear(); // Clear existing items before adding new ones
        items.addAll(itemsData.map((itemJson) => CartItem.fromJson(itemJson)));
        totalItemsCount = response['totalItemsCount'];
        totalPrice = response['totalPrice'];

        if (kDebugMode) {
          print('*******************************');
          print(response['totalItemsCount']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getItemTotalPrice() {}

  @override
  getUserTotalPrice() {}

  @override
  refreshPage() {
    getCart();
  }
}
