
import 'package:ecommerce_app/views/widget/cart/custom_bottom_cart_navigationbar.dart';
import 'package:ecommerce_app/views/widget/cart/custom_cart_appbar.dart';
import 'package:ecommerce_app/views/widget/cart/custom_items_card_list.dart';
import 'package:ecommerce_app/views/widget/cart/top_card_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomCartNavigationbar(price: 1200.00, shipping: 300.00 , total: 1500.00,),
      body: ListView(
        children: const [
          CustomCartAppbar(title: 'MyCart'),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TopCardCart(title: 'You Have 1 Item In Your List')),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomItemsCardList(
                      title: 'MacBook M2 Max', price: 200.00, count: '2'),
                  CustomItemsCardList(
                      title: 'MacBook M2 Max', price: 200.00, count: '2'),
                ],
              ))
        ],
      ),
    );
  }
}
