import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  getCartData(int userId) async {
    var url = '${AppLink.cart}/$userId';
    var response = await crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }

  countItems(int userId, int categoryId) async {
    var url = '${AppLink.countItems}/$userId/$categoryId';
    var response = await crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }

  addItem(int userId, int itemId) async {
    var response = await crud.postData(AppLink.addToCart, {
      "user_id": userId,
      "item_id": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }
  
  removeItem(int userId, int itemId) async {
    var response = await crud.postData(AppLink.removeFromCart, {
      "user_id": userId,
      "item_id": itemId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
