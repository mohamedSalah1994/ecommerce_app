import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/home_data.dart';

class SearchController extends GetxController {
  bool isSearch = false;
  TextEditingController? search;
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());
  SearchController(find);
  List<ItemsModel> listData = [];

searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data'] != null) {
          listData.clear();
          List responseData = response['data'];
          listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val != '') {
      searchData();
      isSearch = true;
    } else {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
    goToItemsDetailsScreen(itemsModel) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {'itemsModel': itemsModel});
  }
}
