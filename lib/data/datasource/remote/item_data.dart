import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);

  getData(int userId , int categoryId) async {
    var url = '${AppLink.items}/$userId/$categoryId';
    var response = await crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }
}
