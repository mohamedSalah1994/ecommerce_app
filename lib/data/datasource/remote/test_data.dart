import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.getData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
