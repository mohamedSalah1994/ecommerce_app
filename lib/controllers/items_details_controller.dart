import 'package:get/get.dart';

import '../data/model/items_model.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel itemsModel;
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
  initialData() {
    itemsModel = Get.arguments['itemsModel'];
  }
}
