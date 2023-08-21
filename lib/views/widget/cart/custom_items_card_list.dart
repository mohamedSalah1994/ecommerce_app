import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomItemsCardList extends StatelessWidget {
  const CustomItemsCardList({super.key, required this.title, required this.price, required this.count});
  final String title;
  final double price;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/logoapp.png',
              height: 100,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title:  Text(title),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '$price \$',
                  style: TextStyle(
                    fontFamily: 'Sans',
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 5),
                Text(
                  count,
                  style: TextStyle(color: AppColors.grey),
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
