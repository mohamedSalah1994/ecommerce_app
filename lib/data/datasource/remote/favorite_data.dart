import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

addItem(int userId , int itemId) async {
    var response = await crud.postData(AppLink.addItem, {
      "user_id": userId,
      "item_id": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeItem(int userId , int itemId) async {
    var response = await crud.postData(AppLink.removeItem, {
      "user_id": userId,
      "item_id": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
