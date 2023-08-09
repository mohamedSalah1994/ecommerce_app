import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  @override
  void onInit() {
    initialData();
    super.onInit();
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
