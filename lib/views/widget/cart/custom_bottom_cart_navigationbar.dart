import 'package:ecommerce_app/views/widget/cart/custom_cart_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomBottomCartNavigationbar extends StatelessWidget {
  const CustomBottomCartNavigationbar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.total});
  final double price;
  final double shipping;
  final double total;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price',
                          style:
                              TextStyle(color: AppColors.grey, fontSize: 18)),
                      Text('$price \$',
                          style:
                              TextStyle(color: AppColors.grey, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping',
                          style:
                              TextStyle(color: AppColors.grey, fontSize: 18)),
                      Text('$shipping \$',
                          style:
                              TextStyle(color: AppColors.grey, fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[400]),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 18)),
                      Text('$total \$',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
        const CustomCartButton(title: 'Place Order')
      ],
    );
  }
}
