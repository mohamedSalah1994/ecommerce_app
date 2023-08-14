import 'package:get/get.dart';

import '../data/model/items_model.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel itemsModel;
  
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
