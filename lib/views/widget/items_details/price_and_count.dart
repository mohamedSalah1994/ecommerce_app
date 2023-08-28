import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount(
      {super.key,
      this.onAdd,
      this.onRemove,
      required this.count,
      required this.price});
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
        Container(
          alignment: Alignment.topCenter,
          width: 40,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.fourthColor,
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Text(
            count,
            style: const TextStyle(
              fontSize: 18,
              height: 1.3
            ),
          ),
        ),
        IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
        const Spacer(),
        Text(
          '$price \$',
          style: const TextStyle(
              fontFamily: 'Sans', fontSize: 24, color: AppColors.secondColor),
        )
      ],
    );
  }
}
