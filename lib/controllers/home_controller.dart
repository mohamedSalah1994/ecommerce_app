import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? name;
  int? id;
  HomeData homeData = HomeData(Get.find());

   List items = [];
  List categories = [];
  List<IconData> categoryIcons = [
    Icons.laptop,
    Icons.camera_alt,
    Icons.mobile_friendly,
     Icons.laptop,
    Icons.camera_alt,
    Icons.mobile_friendly,
    
  ];
  late StatusRequest statusRequest;
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
       // items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    name = myServices.sharedPreferences.getString('name');
    id = myServices.sharedPreferences.getInt('id');
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }
}
