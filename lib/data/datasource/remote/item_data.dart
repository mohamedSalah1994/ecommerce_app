import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);

  getData() async {
    var response = await crud.getData(AppLink.items, {});
    return response.fold((l) => l, (r) => r);
  }
}
