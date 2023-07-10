
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/test_data.dart';


class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    if (kDebugMode) {
      
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // getUsers() async {
  //   Map result = await Crud()
  //       .get(url: 'http://127.0.0.1:8000/api/users', token: '');
  //   print('..................data');
  //   print(result);
  //   data.addAll(result.values);
  //   update();

  //   return result;
  // }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
