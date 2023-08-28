import 'package:ecommerce_app/controllers/search_controller.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';

abstract class HomeController extends SearchController {
  HomeController(super.find);

  getData();
  goToItems(List categories, int selectedCat, int categoryId);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? name;
  int? id;
  String? lang;
 
  

  List items = [];
  List categories = [];



  HomeControllerImp(super.find);
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
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    name = myServices.sharedPreferences.getString('name');
    id = myServices.sharedPreferences.getInt('id');
    lang = myServices.sharedPreferences.getString('lang');
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'selectedCat': selectedCat,
      'catId': categoryId
    });
  }
}
