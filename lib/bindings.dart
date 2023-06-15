import 'package:ecommerce_app/core/class/crud.dart';
import 'package:get/get.dart';

import 'controllers/auth/signup_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(Crud());
  }
}
