import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool light = true;

  onChangeLite(bool value) {
    light = value;
    update();
  }
}
