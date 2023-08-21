import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.titleAppbar,
      this.onPressedSearch,
      this.onPressedIcon});
  final String titleAppbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: titleAppbar,
                helperStyle: const TextStyle(fontSize: 18),
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedSearch),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.favorites);
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
