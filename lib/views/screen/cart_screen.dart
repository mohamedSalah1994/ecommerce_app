import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/views/widget/cart/custom_bottom_cart_navigationbar.dart';
import 'package:ecommerce_app/views/widget/cart/custom_cart_appbar.dart';
import 'package:ecommerce_app/views/widget/cart/custom_items_card_list.dart';
import 'package:ecommerce_app/views/widget/cart/top_card_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
        bottomNavigationBar:  GetBuilder<CartControllerImp>(builder: (controller) => CustomBottomCartNavigationbar(
          price: cartController.totalPrice,
          shipping: cartController.shipping,
          total: cartController.totalPrice + controller.shipping,
        ),),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: cartController.statusRequest,
            widget: ListView(
              children: [
                const CustomCartAppbar(title: 'MyCart'),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: TopCardCart(
                        title:
                            'You Have ${cartController.totalItemsCount} Item In Your List')),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ...List.generate(
                          controller.items.length,
                          (index) => CustomItemsCardList(
                            onAdd: () async {
                              controller.addToCart(controller.items[index].id);
                              // ignore: invalid_use_of_protected_member
                              await controller.refreshPage();
                            },
                            onRemove: () async {
                              cartController.removeFromCart(
                                  cartController.items[index].id);
                              // ignore: invalid_use_of_protected_member
                              await cartController.refreshPage();
                            },
                            title: cartController.items[index].name,
                            price: cartController.items[index].totalCountPrice,
                            count: '${cartController.items[index].quantity}',
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
