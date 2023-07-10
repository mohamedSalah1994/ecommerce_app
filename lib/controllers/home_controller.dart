import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? name;
  int? id;

  initialData() {
    name = myServices.sharedPreferences.getString('name');
    id = myServices.sharedPreferences.getInt('id');
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
